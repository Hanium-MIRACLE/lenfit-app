class Landmarks {
  final String? name;
  final Landmark? landmark;

  Landmarks({this.name, this.landmark});

  Landmarks.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        landmark = json['landmark'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'landmark': landmark,
      };
}

class Landmark {
  final double? x;
  final double? y;
  final double? z;
  final double? v;

  Landmark({this.x, this.y, this.z, this.v});

  Landmark.fromJson(Map<String, dynamic> json)
      : x = json['x'],
        y = json['y'],
        z = json['z'],
        v = json['v'];

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'z': z,
        'v': v,
      };
}
