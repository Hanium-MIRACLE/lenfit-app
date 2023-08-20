import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageAnalysisPreview extends StatelessWidget {
  final double width;
  final double height;
  final Uint8List currentJpeg;
  final double pi = 3.14;

  const ImageAnalysisPreview({
    super.key,
    required this.currentJpeg,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Transform.scale(
        scaleX: -1,
        child: SizedBox.expand(
          child: Image.memory(
            currentJpeg,
            gaplessPlayback: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
