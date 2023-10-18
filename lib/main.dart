import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:jokermovies/data/tables/movie_table.dart';
import 'package:jokermovies/presentation/widgets/movie_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  runApp(MovieApp());
}