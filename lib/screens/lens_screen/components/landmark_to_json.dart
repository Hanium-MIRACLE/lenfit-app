import 'dart:convert';

import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PoseJson {
  final Map<int, dynamic>? pose;

  PoseJson({this.pose});

  factory PoseJson.fromJson(Map<String, dynamic> json) {
    return PoseJson(
      pose: json['pose'],
    );
  }
  Map<String, dynamic> toJson() => {
        'pose': pose,
      };
}

String convertPoseLandmarkToJson(PoseLandmark landmark) {
  /// Convert PoseLandmark to JSON String
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['type'] = landmark.type.toString().split('.')[1];
  data['x'] = landmark.x;
  data['y'] = landmark.y;
  data['z'] = landmark.z;
  data['likelihood'] = landmark.likelihood;
  return json.encode(data);
}
