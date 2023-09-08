import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key, required this.cameraController});
  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (4 / 5),
          child: CameraPreview(cameraController),
        ),
        Container(
          height: MediaQuery.of(context).size.height * (1 / 10),
          color: Colors.black,
        ),
      ],
    );
  }
}
