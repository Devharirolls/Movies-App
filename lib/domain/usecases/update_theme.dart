import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/repositories/app_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class UpdateTheme extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateTheme(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await appRepository.updateTheme(params);
  }
}
