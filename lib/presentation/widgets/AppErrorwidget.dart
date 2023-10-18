import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/domain/entities/app_error.dart';

import 'package:jokermovies/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;
  const AppErrorWidget(
      {super.key, required this.errorType, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w.toDouble()),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)!
                : TranslationConstants.checkNetwork.t(context)!,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Button(text: TranslationConstants.retry, onPressed: onPressed),
          Button(
              text: TranslationConstants.feedback,
              onPressed: () => Wiredash.of(context).show())
        ],
      ),
    );
  }
}
