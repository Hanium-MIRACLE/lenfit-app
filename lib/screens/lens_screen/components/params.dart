// ------------------- Index -------------------
List mediapipeIndex = [
  'NOSE',
  'LEFT_EYE_INNER',
  'LEFT_EYE',
  'LEFT_EYE_OUTER',
  'RIGHT_EYE_INNER',
  'RIGHT_EYE',
  'RIGHT_EYE_OUTER',
  'LEFT_EAR',
  'RIGHT_EAR',
  'MOUTH_LEFT',
  'MOUTH_RIGHT',
  'LEFT_SHOULDER',
  'RIGHT_SHOULDER',
  'LEFT_ELBOW',
  'RIGHT_ELBOW',
  'LEFT_WRIST',
  'RIGHT_WRIST',
  'LEFT_PINKY',
  'RIGHT_PINKY',
  'LEFT_INDEX',
  'RIGHT_INDEX',
  'LEFT_THUMB',
  'RIGHT_THUMB',
  'LEFT_HIP',
  'RIGHT_HIP',
  'LEFT_KNEE',
  'RIGHT_KNEE',
  'LEFT_ANKLE',
  'RIGHT_ANKLE',
  'LEFT_HEEL',
  'RIGHT_HEEL',
  'LEFT_FOOT_INDEX',
  'RIGHT_FOOT_INDEX'
];
List mlkitIndex = [
  'nose',
  'leftEyeInner',
  'leftEye',
  'leftEyeOuter',
  'rightEyeInner',
  'rightEye',
  'rightEyeOuter',
  'leftEar',
  'rightEar',
  'leftMouth',
  'rightMouth',
  'leftShoulder',
  'rightShoulder',
  'leftElbow',
  'rightElbow',
  'leftWrist',
  'rightWrist',
  'leftPinky',
  'rightPinky',
  'leftIndex',
  'rightIndex',
  'leftThumb',
  'rightThumb',
  'leftHip',
  'rightHip',
  'leftKnee',
  'rightKnee',
  'leftAnkle',
  'rightAnkle',
  'leftHeel',
  'rightHeel',
  'leftFootIndex',
  'rightFootIndex'
];
List state = List.filled(33, 0);
List poseIndex = [mlkitIndex, mediapipeIndex, state];

Map<String, int> mlkitDict = {
  'nose': 0,
  'leftEyeInner': 0,
  'leftEye': 0,
  'leftEyeOuter': 0,
  'rightEyeInner': 0,
  'rightEye': 0,
  'rightEyeOuter': 0,
  'leftEar': 0,
  'rightEar': 0,
  'leftMouth': 0,
  'rightMouth': 0,
  'leftShoulder': 0,
  'rightShoulder': 0,
  'leftElbow': 0,
  'rightElbow': 0,
  'leftWrist': 0,
  'rightWrist': 0,
  'leftPinky': 0,
  'rightPinky': 0,
  'leftIndex': 0,
  'rightIndex': 0,
  'leftThumb': 0,
  'rightThumb': 0,
  'leftHip': 0,
  'rightHip': 0,
  'leftKnee': 0,
  'rightKnee': 0,
  'leftAnkle': 0,
  'rightAnkle': 0,
  'leftHeel': 0,
  'rightHeel': 0,
  'leftFootIndex': 0,
  'rightFootIndex': 0
};
Map<String, String?> mlkitToMediapipe = {
  'nose': 'NOSE',
  'leftEyeInner': 'LEFT_EYE_INNER',
  'leftEye': 'LEFT_EYE',
  'leftEyeOuter': 'LEFT_EYE_OUTER',
  'rightEyeInner': 'RIGHT_EYE_INNER',
  'rightEye': 'RIGHT_EYE',
  'rightEyeOuter': 'RIGHT_EYE_OUTER',
  'leftEar': 'LEFT_EAR',
  'rightEar': 'RIGHT_EAR',
  'leftMouth': 'MOUTH_LEFT',
  'rightMouth': 'MOUTH_RIGHT',
  'leftShoulder': 'LEFT_SHOULDER',
  'rightShoulder': 'RIGHT_SHOULDER',
  'leftElbow': 'LEFT_ELBOW',
  'rightElbow': 'RIGHT_ELBOW',
  'leftWrist': 'LEFT_WRIST',
  'rightWrist': 'RIGHT_WRIST',
  'leftPinky': 'LEFT_PINKY',
  'rightPinky': 'RIGHT_PINKY',
  'leftIndex': 'LEFT_INDEX',
  'rightIndex': 'RIGHT_INDEX',
  'leftThumb': 'LEFT_THUMB',
  'rightThumb': 'RIGHT_THUMB',
  'leftHip': 'LEFT_HIP',
  'rightHip': 'RIGHT_HIP',
  'leftKnee': 'LEFT_KNEE',
  'rightKnee': 'RIGHT_KNEE',
  'leftAnkle': 'LEFT_ANKLE',
  'rightAnkle': 'RIGHT_ANKLE',
  'leftHeel': 'LEFT_HEEL',
  'rightHeel': 'RIGHT_HEEL',
  'leftFootIndex': 'LEFT_FOOT_INDEX',
  'rightFootIndex': 'RIGHT_FOOT_INDEX'
};

// ------------------- joint -------------------

// left side
List jointLeftKnee = ['LEFT_HIP', 'LEFT_KNEE', 'LEFT_ANKLE'];
List jointLeftHip = ['LEFT_SHOULDER', 'LEFT_HIP', 'LEFT_KNEE'];
List jointLeftAnkle = ['LEFT_KNEE', 'LEFT_ANKLE', 'LEFT_FOOT_INDEX'];
List jointLeftElbow = ['LEFT_SHOULDER', 'LEFT_ELBOW', 'LEFT_WRIST'];
List jointLeftShoulder = ['LEFT_HIP', 'LEFT_SHOULDER', 'LEFT_ELBOW'];
List jointLeftWrist = ['LEFT_ELBOW', 'LEFT_WRIST', 'LEFT_INDEX'];

// right side
List jointRightKnee = ['RIGHT_HIP', 'RIGHT_KNEE', 'RIGHT_ANKLE'];
List jointRightHip = ['RIGHT_SHOULDER', 'RIGHT_HIP', 'RIGHT_KNEE'];
List jointRightAnkle = ['RIGHT_KNEE', 'RIGHT_ANKLE', 'RIGHT_FOOT_INDEX'];
List jointRightElbow = ['RIGHT_SHOULDER', 'RIGHT_ELBOW', 'RIGHT_WRIST'];
List jointRightShoulder = ['RIGHT_HIP', 'RIGHT_SHOULDER', 'RIGHT_ELBOW'];
List jointRightWrist = ['RIGHT_ELBOW', 'RIGHT_WRIST', 'RIGHT_INDEX'];

// ------------------- joint -------------------
Map<String, List> workoutJoints = {
  'Squat': [jointLeftKnee, jointLeftHip, jointLeftAnkle], // 3개
  'Pushup': [
    jointLeftWrist,
    jointLeftElbow,
    jointLeftShoulder,
    jointLeftHip,
    jointLeftKnee
  ], // 5개
  'Lunge': [
    jointLeftKnee,
    jointLeftHip,
    jointLeftAnkle,
    jointRightKnee,
    jointRightHip,
    jointRightAnkle
  ], // 6개
  'Pullup': [
    jointLeftWrist,
    jointLeftElbow,
    jointLeftShoulder,
    jointRightWrist,
    jointRightElbow,
    jointRightShoulder
  ], // 6개
  'ArmCurl': [jointLeftElbow, jointRightElbow] // 2개
};

// ------------------- angle -------------------
Map<String, dynamic> workoutLimitAngle = {
  'Squat': [84, 27, 28],
  'Pushup': [0, 0, 0, 0, 0],
  'Lunge': [0, 0, 0, 0, 0, 0],
  'Pullup': [0, 0, 0, 0, 0, 0],
  'ArmCurl': [0, 0]
};

// ------------------- comment -------------------
Map<String, dynamic> workoutComments = {
  'Squat': [
    'Knee is too much bent',
    'Hip is too much bent',
    'Ankle is too much bent'
  ],
  'Pushup': [
    'elbow is too much bent',
    'shoulder is too much bent',
    'wrist is too much bent',
    'hip is too much bent',
    'knee is too much bent'
  ],
  'Lunge': [
    'Knee is too much bent',
    'Hip is too much bent',
    'Ankle is too much bent'
  ],
  'Pullup': [
    'elbow is too much bent',
    'shoulder is too much bent',
    'wrist is too much bent',
    'hip is too much bent',
    'knee is too much bent'
  ],
  'ArmCurl': ['elbow is too much bent']
};
