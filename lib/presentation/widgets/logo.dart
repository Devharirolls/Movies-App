import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/blocs/theme/theme_cubit.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';


class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      key: const ValueKey('logo_image_key'),
      color: context.read<ThemeCubit>().state == Themes.dark
          ? Colors.white
          : AppColor.vulcan,
      height: height.h.toDouble(),
    );
  }
}
