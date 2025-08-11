import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> gradientColors;
  final List<double> stops;

  const VideoBackground({
    super.key,
    this.gradientColors = const [Colors.transparent, Colors.black87],
    this.stops = const [0.0, 1.0],
  }): assert(gradientColors.length == stops.length, '(Positioned/Stops) and Colors must be same length ');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors, 
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
      ),
    );
  }
}
