import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/presentation/blocs/cast/cast_cubit.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(builder: (context, state) {
      if (state is CastLoaded) {
        return Container(
          height: Sizes.dimen_105.h.toDouble(),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final castEntity = state.casts[index];
                return Container(
                  height: Sizes.dimen_100.h.toDouble(),
                  width: Sizes.dimen_160.w.toDouble(),
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_10.w.toDouble(),
                        vertical: Sizes.dimen_2.h.toDouble()),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.dimen_8.w.toDouble()))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.w.toDouble())),
                          child: CachedNetworkImage(
                            height: Sizes.dimen_100.h.toDouble(),
                            width: Sizes.dimen_160.w.toDouble(),
                            imageUrl:
                                '${ApiConstants.BASE_IMAGE_URL}${castEntity.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_8.w.toDouble()),
                          child: Center(
                            child: Text(
                              castEntity.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColor.vulcan),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: Sizes.dimen_8.w.toDouble(),
                            left: Sizes.dimen_8.w.toDouble(),
                            bottom: Sizes.dimen_2.h.toDouble(),
                          ),
                          child: Text(
                            castEntity.character,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
