import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/entities/no_params.dart';
import 'package:jokermovies/domain/repositories/authentication_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams noParams) async =>
      _authenticationRepository.logoutUser();
}