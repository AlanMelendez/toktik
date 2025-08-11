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

        if(snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 2,),
          );
        }

        return GestureDetector(
          onTap: () => {
            if(_controller.value.isPlaying) {
              _controller.pause()
            } else {
              _controller.play()
            }
          },
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
          
                  //Gradient overlay
                  // Container(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.bottomCenter,
                  //       end: Alignment.topCenter,
                  //       colors: [
                  //         Colors.black.withOpacity(0.7),
                  //         Colors.transparent,
                  //       ],
                  //     ),
                  //   ),
                  // ),
          
                  Positioned(
                    bottom: 50,
                    left: 20,
                    right: 20,
                    child: _VideoCaption(caption: 'Default Captions',),
                  ),
                ],
              )
            ),
        );
      } ,
    );
  }

}


  class _VideoCaption extends StatelessWidget {

    final String caption;
    const _VideoCaption({super.key , required this.caption});
  
    @override
    Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size; //Reference to the screen size
      final titleStyle = Theme.of(context).textTheme.titleLarge;

      return SizedBox(
        width: size.width * 0.7, //60% of the screen width
        child: Text(
          caption,
          maxLines: 2,
          style: titleStyle,                               
          textAlign: TextAlign.center,
        ),
        
      );
    }
  }
 