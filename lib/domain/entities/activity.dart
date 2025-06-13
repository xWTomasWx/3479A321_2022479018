class Activity {
  final int? id;
  final String name;
  final String date;

  Activity({this.id, required this.name, required this.date});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'date': date};
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(id: map['id'], name: map['name'], date: map['date']);
  }
}
