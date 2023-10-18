import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:jokermovies/data/core/unauthorised_exception.dart';
import 'package:jokermovies/data/data_source/authentication_local_data_source.dart';
import 'package:jokermovies/data/data_source/authentication_remote_data_source.dart';
import 'package:jokermovies/data/models/request_token_model.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,this._authenticationLocalDataSource);

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 =
        requestTokenEitherResponse.getOrElse(() => null!).requestToken;

    try {
      params.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await _authenticationRemoteDataSource.validateWithLogin(params);
      final sessionId = await _authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
       if (sessionId != null) {
         await _authenticationLocalDataSource.saveSessionId(sessionId);
      return const Right(true);
       }
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    if (sessionId != null) {
      await Future.wait([
        _authenticationRemoteDataSource.deleteSession(sessionId),
        _authenticationLocalDataSource.deleteSessionId(),
      ]);
    }
    print(await _authenticationLocalDataSource.getSessionId());
    return const Right(Unit);
  }
}
