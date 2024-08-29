import 'package:firebase_database/firebase_database.dart';

import 'student.dart';

class FirebaseHelper {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('students');

  Future<void> addStudent(Student student) async {
    try {
      final id = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Generate a unique ID
      await _database.child(id).set(student.toJson());
    } catch (e) {
      print('Error adding student: $e');
    }
  }

  Future<void> updateStudent(String id, Student student) async {
    try {
      await _database.child(id).update(student.toJson());
    } catch (e) {
      print('Error updating student: $e');
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await _database.child(id).remove();
    } catch (e) {
      print('Error deleting student: $e');
    }
  }

  Future<List<Student>> getAllStudents() async {
    List<Student> studentsList = [];
    try {
      final snapshot = await _database.once();
      final Map<dynamic, dynamic>? studentsMap =
          snapshot.snapshot.value as Map?;
      if (studentsMap != null) {
        studentsMap.forEach((key, value) {
          // Convert dynamic to Map<String, dynamic>
          final studentJson = Map<String, dynamic>.from(value);
          final student = Student.fromJson(studentJson);
          student.id = key; // Assign the Firebase key to the student ID
          studentsList.add(student);
        });
      }
    } catch (e) {
      print('Error fetching students: $e');
    }
    return studentsList;
  }
}
