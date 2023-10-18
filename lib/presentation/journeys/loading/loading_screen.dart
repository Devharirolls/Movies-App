import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/blocs/loading/loading_cubit.dart';
import 'package:jokermovies/presentation/journeys/loading/loading_circle.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, shouldShow) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if(shouldShow)
            Container(
              decoration:
                  BoxDecoration(color: AppColor.vulcan.withOpacity(0.8)),
              child: Center(
                child: LoadingCircle(
                  size: Sizes.dimen_200.w.toDouble(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
