
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/presentation/journeys/home/movie-tabbed/tab.dart';

class MovieTabbedConstants {
  static List<Tabs> movieTabs = const[
    Tabs(index: 0, title: TranslationConstants.popular),
    Tabs(index: 1, title: TranslationConstants.now),
    Tabs(index: 2, title: TranslationConstants.soon),
   
  ];
}
