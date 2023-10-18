import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/languages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/screenutil/screenutil.dart';
import 'package:jokermovies/di/get_it.dart';
import 'package:jokermovies/presentation/blocs/language/language_cubit.dart';
import 'package:jokermovies/presentation/blocs/loading/loading_cubit.dart';
import 'package:jokermovies/presentation/blocs/login/login_cubit.dart';
import 'package:jokermovies/presentation/blocs/theme/theme_cubit.dart';
import 'package:jokermovies/presentation/journeys/home/home_screen.dart';
import 'package:jokermovies/presentation/journeys/loading/loading_screen.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';
import 'package:jokermovies/presentation/widgets/fade_page_route_builder.dart';
import 'package:jokermovies/presentation/widgets/routes.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/widgets/app_localizations.dart';
import 'package:jokermovies/presentation/widgets/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageCubit _languageCubit;
  late LoginCubit _loginBloc;
  late LoadingCubit _loadingCubit;
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit.loadPreferredLanguage();
    _loginBloc = getItInstance<LoginCubit>();
    _loadingCubit = getItInstance<LoadingCubit>();
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit.loadPreferredTheme();
  }

  @override
  void dispose() {
    _languageCubit.close();
    _loginBloc.close();
    _loadingCubit.close();
    _themeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>.value(value: _languageCubit),
        BlocProvider<LoginCubit>.value(value: _loginBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        BlocProvider<ThemeCubit>.value(value: _themeCubit),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return WiredashApp(
                navigatorKey: _navigatorKey,
                languageCode: locale.languageCode,
                child: MaterialApp(
                  navigatorKey: _navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Movie App',
                  theme: ThemeData(
                    brightness: theme == Themes.dark?Brightness.dark :Brightness.light,
                    unselectedWidgetColor: AppColor.royalBlue,
                    primaryColor:
                        theme == Themes.dark ? AppColor.vulcan : Colors.white,
                    scaffoldBackgroundColor:
                        theme == Themes.dark ? AppColor.vulcan : Colors.white,
                    
                    cardTheme: CardTheme(
                      color:
                          theme == Themes.dark ? Colors.white : AppColor.vulcan,
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: theme == Themes.dark
                        ? ThemeText.getTextTheme()
                        : ThemeText.getLightTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0),
                    inputDecorationTheme: InputDecorationTheme(
                      hintStyle: Theme.of(context).textTheme.greySubtitle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: theme == Themes.dark
                              ? Colors.white
                              : AppColor.vulcan,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  builder: (context, child) {
                    return LoadingScreen(
                      screen: child!,
                    );
                  },
                  initialRoute: RouteList.initial,
                  onGenerateRoute: (RouteSettings settings) {
                    final routes = Routes.getRoutes(settings);
                    final WidgetBuilder? builder = routes[settings.name];
                    return FadePageRouteBuilder(
                      builder: builder!,
                      settings: settings,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
