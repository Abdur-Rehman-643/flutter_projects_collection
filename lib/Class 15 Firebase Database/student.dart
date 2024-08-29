import 'dart:convert';

class Student {
  String? id;
  final String name;
  final int age;
  final String semester;

  Student({
    this.id,
    required this.name,
    required this.age,
    required this.semester,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'semester': semester,
      };

  factory Student.fromJson(var json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      semester: json['semester'],
    );
  }

  String toJsonString() => json.encode(toJson());

  factory Student.fromJsonString(String jsonString) {
    return Student.fromJson(json.decode(jsonString));
  }
}
