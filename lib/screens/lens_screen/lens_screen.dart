import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'components/pose_detector_view.dart';

class LensScreen extends StatefulWidget {
  const LensScreen({super.key});

  @override
  State<LensScreen> createState() => _LensScreenState();
}

class _LensScreenState extends State<LensScreen> {
  CameraController? _cameraController;

  void readyToCamera() async {
    final cameras = await availableCameras();
    if (cameras.length == 0) {
      print("not found any cameras");
      return;
    }
    CameraDescription frontCamera;
    for (var camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        _cameraController = CameraController(
          frontCamera,
          ResolutionPreset.max,
        );
        _cameraController?.initialize().then((value) {});
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // readyToCamera();
  }

  @override
  void dispose() {
    // if (_cameraController != null) {
    //   _imageStreamController.close();
    //   _cameraController!.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PoseDetectorView();

    // return Scaffold(
    //   body: _cameraInitialized
    //       ? CameraScreen(
    //           cameraController: _cameraController!,
    //         )
    //       : const Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.white,
    //             valueColor: AlwaysStoppedAnimation<Color>(
    //               Colors.black,
    //             ),
    //           ),
    //         ),
    // );
  }
}
