import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  final double size;
  const LoadingCircle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FlareActor(
        'assets/animations/loading_circle.flr',
        snapToEnd: true,
        animation: 'load',
      ),
    );
  }
}
