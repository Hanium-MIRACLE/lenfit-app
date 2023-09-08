import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'detector_view.dart';
import 'landmark_to_json.dart';
import 'pose_painter.dart';
import 'params.dart';
import 'feedback.dart';

class PoseDetectorView extends StatefulWidget {
  const PoseDetectorView({super.key});

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;
  static int count = 0;
  static List<Map<int, dynamic>> landmarksJsonList = [];

  @override
  void dispose() async {
    _canProcess = false;
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetectorView(
      title: 'Pose Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: _processImage,
      initialCameraLensDirection: _cameraLensDirection,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final poses = await _poseDetector.processImage(inputImage);
    if (poses.isNotEmpty) {
      count++;
      Map<String, dynamic> landmarkJson = {};
      Map<int, dynamic> landmarksJson = {};
      late PoseJson? jsonString;
      for (final pose in poses) {
        for (final landmark in pose.landmarks.values) {
          String? joint = landmark.type.toString().split('.')[1];
          // mlkitDict[joint] = 1;
          landmarkJson[mlkitToMediapipe[joint]!] = [
            landmark.x,
            landmark.y,
            landmark.z,
            landmark.likelihood
          ];
        }
        Map<String, String> comments = feedback(landmarkJson, 'Squat');
        // for (var key in comments.keys) {
        // print(landmarkJson[key]);
        // print(comments[key]);
        // }
        landmarksJson[count] = landmarkJson;
        landmarksJsonList.add(landmarksJson);
      }
      jsonString = PoseJson(pose: landmarksJson);
      print(landmarksJsonList.toString());
    }
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = PosePainter(
        poses,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Poses found: ${poses.length}\n\n';
      // if (poses.isNotEmpty) {
      // for (final pose in poses) {
      //   for (final landmark in pose.landmarks.values) {
      //     Landmarks(
      //       name: "${landmark.type}".split('.')[1],
      //       landmark: Landmark(
      //         x: landmark.x,
      //         y: landmark.y,
      //         z: landmark.z,
      //         v: landmark.likelihood,
      //       ),
      //     );
      //   }
      // }
      // }
      // TODO: set _customPaint to draw landmarks on top of image
      _customPaint;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
