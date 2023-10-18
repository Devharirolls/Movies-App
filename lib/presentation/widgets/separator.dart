import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h.toDouble(),
      width: Sizes.dimen_80.w.toDouble(),
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h.toDouble(),
        bottom: Sizes.dimen_6.h.toDouble()
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h.toDouble())),
        gradient: LinearGradient(colors: [
          AppColor.violet,
          AppColor.royalBlue,
        ])
      ),
    );
  }
}
