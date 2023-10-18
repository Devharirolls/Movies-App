import 'package:jokermovies/domain/entities/language_entities.dart';

class Languages {
  const Languages._();

  static  List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'ta', value: 'Tamil'),
  ];
}
