import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/domain/entities/video_entity.dart';
import 'package:jokermovies/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideoScreen({super.key, required this.watchVideoArguments});

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _videos[0].key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.watchTrailers.t(context)!,
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(controller: _controller),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                player,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < _videos.length; i++)
                          Container(
                            height: 60.h.toDouble(),
                            padding: EdgeInsets.symmetric(
                                vertical: Sizes.dimen_8.h.toDouble()),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _controller.load(_videos[i].key);
                                    _controller.play();
                                  },
                                  child: CachedNetworkImage(
                                      width: Sizes.dimen_60.w.toDouble(),
                                      imageUrl: YoutubePlayer.getThumbnail(
                                          videoId: _videos[i].key,
                                          quality: ThumbnailQuality.high)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w.toDouble()),
                                    child: Text(_videos[i].title,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
