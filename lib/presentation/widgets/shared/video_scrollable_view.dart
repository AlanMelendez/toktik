import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';


class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;


  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {

    return PageView( // Este widget permite hacer scroll horizontal entre los videos a PANTALLA COMPLETA
      scrollDirection: Axis.vertical, //Set scroll in vertical direction
      children: [
        Container(color: Colors.amber),
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.red),
        Container(color: Colors.purple),
        
      ],
    );
  }
}