import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/repositories/app_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateLanguage(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}