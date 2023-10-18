import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';

class TabTitleWidget extends StatelessWidget {
  final String? title;
  final Function() onTap;
  final bool isSelected;
  const TabTitleWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.isSelected = false})
      : assert(title != null, 'title should not be null'),
        assert(onTap != null, 'on tab should not be null'),
        assert(isSelected != null, 'isselected should not be null');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: isSelected ? AppColor.royalBlue : Colors.transparent,
                    width: Sizes.dimen_1.h.toDouble()))),
        child: Text(
          title!.t(context)!, //'popular','now','soon';
          style: isSelected
              ? TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.royalBlue)
              : const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
        ),
      ),
    );
  }
}
