import 'package:flutter/material.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatoeKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({super.key, this.navigatoeKey, required this.child, required this.languageCode, required GlobalKey<NavigatorState> navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-woof17n',
      secret: 'FIzhm3H9CDND-QRwqZUKbLsuPNmWdJxe',
      child: child,
      options: WiredashOptionsData(locale: Locale.fromSubtags(languageCode: languageCode)),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
    );
  }
}
