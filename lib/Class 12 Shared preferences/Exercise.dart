import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student {
  final String id;
  final String name;
  final int age;
  final String semester;

  Student({
    required this.id,
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

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        semester: json['semester'],
      );

  String toJsonString() => json.encode(toJson());

  factory Student.fromJsonString(String jsonString) =>
      Student.fromJson(json.decode(jsonString));
}

class StudentManager {
  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  static Future<List<Student>> getAllStudents() async {
    final prefs = await _prefs;
    List<Student> studentList = [];
    var keys = prefs.getKeys();
    for (var key in keys) {
      var studentRecord = prefs.getString(key) ?? "";
      Student student = Student.fromJsonString(studentRecord);
      studentList.add(student);
    }
    return studentList;
  }

  static Future<void> addStudent(Student student) async {
    final prefs = await _prefs;
    prefs.setString(student.id, student.toJsonString());
  }

  static Future<void> removeStudent(String id) async {
    final prefs = await _prefs;
    prefs.remove(id);
  }

  static Future<void> updateStudent(Student student) async {
    final prefs = await _prefs;
    prefs.setString(student.id, student.toJsonString());
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Student> _students = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  void _loadStudents() async {
    List<Student> students = await StudentManager.getAllStudents();
    setState(() {
      _students = students;
      _isLoading = false;
    });
  }

  void _addStudent() {
    _showStudentDialog();
  }

  void _editStudent(Student student) {
    _showStudentDialog(student: student);
  }

  void _removeStudent(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure to delete?'),
        actions: [
          TextButton(
            onPressed: () {
              StudentManager.removeStudent(id).then((_) {
                setState(() {
                  _students.removeWhere((student) => student.id == id);
                });
                Navigator.of(context).pop();
              });
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _showStudentDialog({Student? student}) {
    final _nameController = TextEditingController(text: student?.name ?? '');
    final _ageController = TextEditingController(
        text: student != null ? student!.age.toString() : '');
    final _semesterController =
        TextEditingController(text: student?.semester ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(student == null ? 'Add Student' : 'Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final id = student?.id ?? DateTime.now().toString();
                final newStudent = Student(
                  id: id,
                  name: _nameController.text,
                  age: int.parse(_ageController.text),
                  semester: _semesterController.text,
                );

                if (student == null) {
                  StudentManager.addStudent(newStudent).then((_) {
                    setState(() {
                      _students.add(newStudent);
                    });
                  });
                } else {
                  StudentManager.updateStudent(newStudent).then((_) {
                    setState(() {
                      final index =
                          _students.indexWhere((s) => s.id == student.id);
                      _students[index] = newStudent;
                    });
                  });
                }

                Navigator.of(context).pop();
              },
              child: Text(student == null ? 'Add' : 'Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Manager'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(
                    'Age: ${student.age}, Semester: ${student.semester}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editStudent(student),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeStudent(student.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        child: Icon(Icons.add),
      ),
    );
  }
}
