import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';


class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;


  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {

    return PageView.builder( // Este widget permite hacer scroll horizontal entre los videos a PANTALLA COMPLETA
      scrollDirection: Axis.vertical, //Set scroll in vertical direction
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return Stack(
          children: [
            //Video Player + gradiente

            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video)
            )

          ],
        ) ;
      },
    );
  }
}