import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController _controller;
  // bool _isPlaying = false;
  
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset( widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }





  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  _controller.initialize(),
      builder: (context, snapshot) {

        return Center(
            child: CircularProgressIndicator(strokeWidth: 2,),
        );
      } ,
    );
  }
}
 