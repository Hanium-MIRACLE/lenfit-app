class WorkoutRecord {
  final int id;
  final String name;
  final int count;
  final int score;
  final int calories;
  final String notes;
  final String date;

  WorkoutRecord({
    required this.id,
    required this.name,
    required this.count,
    required this.score,
    required this.calories,
    required this.notes,
    required this.date,
  });

  WorkoutRecord.fromJson({required Map<String, dynamic> json})
      : id = json['id'],
        name = json['name'],
        count = json['count'],
        score = json['score'],
        calories = json['calories'],
        notes = json['notes'],
        date = json['date'];
}
