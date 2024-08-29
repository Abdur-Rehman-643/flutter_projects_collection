class Task {
  String? id;
  final String title;
  final String description;
  final String date;
  final String time;
  final int status;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String?,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      status: map['status'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task.fromMap(json);
  Map<String, dynamic> toJson() => toMap();
}
