import 'package:flutter/material.dart';


class FullScreenPlayer extends StatelessWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    this.videoUrl = 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    this.caption = 'No caption'
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
 