import 'package:jokermovies/data/data_source/language_local_data_source.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl(this.languageLocalDataSource);
  
  get themeName => null;

  @override
  Future<Either<AppError, String?>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await languageLocalDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
  
  @override
  Future<Either<AppError, String>> getPreferredTheme() async{
    try {
      final response = await languageLocalDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
  
  @override
  Future<Either<AppError, void>> updateTheme(String theme)async {
     try {
      final response = await languageLocalDataSource.updateTheme(themeName);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
  }

