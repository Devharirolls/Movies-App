import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/languages.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/presentation/blocs/language/language_cubit.dart';
import 'package:jokermovies/presentation/blocs/login/login_cubit.dart';
import 'package:jokermovies/presentation/blocs/theme/theme_cubit.dart';
import 'package:jokermovies/presentation/journeys/drawer/navigation_expanded_list.dart';
import 'package:jokermovies/presentation/journeys/drawer/navigator_list_item.dart';
import 'package:jokermovies/presentation/journeys/favorite_screen/favorite_screen.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/widgets/app_dialog.dart';
import 'package:jokermovies/presentation/widgets/app_localizations.dart';
import 'package:jokermovies/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_100.w.toDouble(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h.toDouble(),
                bottom: Sizes.dimen_18.h.toDouble(),
                left: Sizes.dimen_8.w.toDouble(),
                right: Sizes.dimen_8.w.toDouble(),
              ),
              child: Logo(
                height: Sizes.dimen_20.h.toDouble(),
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.favorite);
              },
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) => _onLanguageSelected(index, context),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
            BlocListener<LoginCubit, LoginState>(
              listenWhen: (previous, current) => current is LogoutSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteList.initial, (route) => false);
              },
              child: NavigationListItem(
                title: TranslationConstants.logout.t(context),
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).logout();
                },
              ),
            ),
            SizedBox(
              height: Sizes.dimen_32.h.toDouble(),
            ),

            // BlocBuilder<ThemeCubit, Themes>(builder: (context, theme) {
            //   return Align(
            //     alignment: Alignment.center,
            //     child: GestureDetector(
            //       onTap: () => context.read<ThemeCubit>().toggleTheme(),
            //       child: IconButton(
            //         onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            //         icon: Icon(
            //           theme == Themes.dark
            //               ? Icons.brightness_4_sharp
            //               : Icons.brightness_7_sharp,
            //           color: context.read<ThemeCubit>().state == Themes.dark
            //               ? Colors.white
            //               : AppColor.vulcan,
            //           size: Sizes.dimen_40.w.toDouble(),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }

  void _onLanguageSelected(int index, BuildContext context) {
    BlocProvider.of<LanguageCubit>(context).toggleLanguage(
      Languages.languages[index],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.ok,
        images: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_32.h.toDouble(),
        ),
      ),
    );
  }
}
