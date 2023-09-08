import 'dart:math';
import 'package:vector_math/vector_math.dart';

import 'params.dart';

double calculateAngle(List<double> a, List<double> b, List<double> c) {
  var vectorA = Vector2(a[0], a[1]);
  var vectorB = Vector2(b[0], b[1]);
  var vectorC = Vector2(c[0], c[1]);

  var radians = atan2(vectorC.y - vectorB.y, vectorC.x - vectorB.x) -
      atan2(vectorA.y - vectorB.y, vectorA.x - vectorB.x);
  var angle = (radians * 180.0 / pi).abs();

  if (angle > 180.0) {
    angle = 360 - angle;
  }

  return angle;
}

String angleToComment(double angle, int limit, String comment) {
  if (angle > limit) {
    return 'Good';
  } else {
    return 'Bad';
  }
}

// String workout = 'Squat';
Map<String, String> feedback(Map<String, dynamic> landmarks, String workout) {
  Map<String, String> comments = {};
  int i = 0;
  for (final joints in workoutJoints[workout]!) {
    if (landmarks[joints[1]] == null) {
      comments[joints[1]] = 'No joint detected';
    }
    List<double> a = [landmarks[joints[0]][0], landmarks[joints[0]][1]];
    List<double> b = [landmarks[joints[1]][0], landmarks[joints[1]][1]];
    List<double> c = [landmarks[joints[2]][0], landmarks[joints[2]][1]];

    double angle = calculateAngle(a, b, c);
    String comment = angleToComment(
        angle, workoutLimitAngle[workout][i], workoutComments[workout][i]);
    comments[joints[1]] = comment;
    i++;
  }
  return comments;
}
