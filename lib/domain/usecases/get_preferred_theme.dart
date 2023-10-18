
import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/entities/no_params.dart';
import 'package:jokermovies/domain/repositories/app_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class GetPreferredTheme extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredTheme(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredTheme();
  }
}