import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle? get _whiteHeadline6 =>
      _poppinsTextTheme.titleLarge?.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );

  static TextStyle? get _whiteHeadline5 =>
      _poppinsTextTheme.headlineSmall?.copyWith(
        fontSize: Sizes.dimen_24.sp.toDouble(),
        color: AppColor.white,
      );

  static TextStyle? get whiteSubtitle1 => _poppinsTextTheme.titleMedium
      ?.copyWith(fontSize: Sizes.dimen_16.sp.toDouble(), color: Colors.white);

  static TextStyle? get whiteButton => _poppinsTextTheme.labelLarge
      ?.copyWith(fontSize: Sizes.dimen_14.sp.toDouble(), color: Colors.white);

  static TextStyle? get whiteBodyText2 =>
      _poppinsTextTheme.bodyMedium?.copyWith(
        color: Colors.blue,
        fontSize: Sizes.dimen_14.sp.toDouble(),
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headlineSmall: _whiteHeadline5,
        titleLarge: _whiteHeadline6,
        titleMedium: whiteSubtitle1,
        bodyMedium: whiteBodyText2,
        labelLarge: whiteButton,
      );

  static getLightTextTheme() {}
}

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalBlueSubtitle => titleMedium?.copyWith(
      color: AppColor.royalBlue, fontWeight: FontWeight.w600);

  TextStyle? get greySubtitle => titleMedium?.copyWith(color: Colors.grey);

  TextStyle? get violetHeadline6 =>
      titleLarge?.copyWith(color: AppColor.violet);

  TextStyle? get vulcanBodyText2 =>
      titleLarge?.copyWith(color: AppColor.vulcan, fontWeight: FontWeight.w600);

  TextStyle? get greyCaption => bodySmall?.copyWith(color: Colors.grey);

  TextStyle? get orangeSubtitle1 =>
      titleMedium?.copyWith(color: Colors.orangeAccent);
}
