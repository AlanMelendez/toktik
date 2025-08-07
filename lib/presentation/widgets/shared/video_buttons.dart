import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';


class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       _CustomButton(
        value: video.likes,
        icon: Icons.favorite,
        iconColor: Colors.red
       ),
       _CustomButton(
        value: video.views,
        icon: Icons.remove_red_eye_outlined,
       ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomButton(
            value: 0,
            icon: Icons.play_circle_fill_outlined,
          ),
        ),

      ],
    );
  }
}


class _CustomButton extends StatelessWidget {
 
 final int value;
 final IconData icon;
 final Color? color;

 const _CustomButton({
    required this.value,
    required this.icon,
    iconColor
     
  }):color = iconColor ?? Colors.white;
 
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: Icon(icon, color: color, size: 40)),

        if(value > 0)
        Text(HumanFormats.formatNumber(value), style: const TextStyle(color: Colors.white, fontSize: 16))
      ],
    );
  }
}