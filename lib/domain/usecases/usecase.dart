import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
