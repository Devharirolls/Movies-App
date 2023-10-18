import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget images;

  const AppDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w.toDouble()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8.w.toDouble()),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
            top: Sizes.dimen_4.h.toDouble(),
            left: Sizes.dimen_16.w.toDouble(),
            right: Sizes.dimen_16.w.toDouble()),
        decoration: BoxDecoration(boxShadow: [
          const BoxShadow(color: AppColor.vulcan, blurRadius: Sizes.dimen_16)
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title.t(context)!,
                style: TextStyle(
                    fontSize: Sizes.dimen_32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Sizes.dimen_6.h.toDouble()),
              child: Text(
                description.t(context)!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Sizes.dimen_14, color: Colors.white),
              ),
            ),
            if (images != null) images,
            Button(
                text: TranslationConstants.ok,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
    ;
  }
}
