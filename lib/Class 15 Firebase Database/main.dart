import 'package:firebase_core/firebase_core.dart';
import 'package:first_mini_project/Class 15 Firebase Database/firebase_helper.dart';
import 'package:first_mini_project/Class 15 Firebase Database/student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StudentManagementApp(),
      ),
    );
  } catch (e) {
    runApp(MaterialApp(home: ErrorScreen(error: e.toString())));
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentManagementApp(),
    ),
  );
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for iOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBt1pHSJk_vGrgZIpsBcBCo6-kTHYvkDwA",
    appId: '1:530439151974:android:90bd7c4b7f87dc18c968a7',
    messagingSenderId: '530439151974',
    projectId: 'student-app-88643',
  );
}

class StudentManagementApp extends StatefulWidget {
  @override
  _StudentManagementAppState createState() => _StudentManagementAppState();
}

class _StudentManagementAppState extends State<StudentManagementApp> {
  List<Student> students = [];
  final firebaseHelper = FirebaseHelper();
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      await _fetchStudents();
    } catch (e) {
      setState(() {
        errorMessage = 'Error initializing Firebase: $e';
        isLoading = false;
      });
    }
  }

  Future<void> _fetchStudents() async {
    try {
      final fetchedStudents = await firebaseHelper.getAllStudents();
      setState(() {
        students = fetchedStudents;
        isLoading = false;
        errorMessage = '';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching students: $e';
        isLoading = false;
      });
    }
  }

  void _addStudent() async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        String name = '';
        int age = 0;
        String semester = '';
        return AlertDialog(
          title: Text('Add Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Semester'),
                onChanged: (value) {
                  semester = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                try {
                  await firebaseHelper.addStudent(
                    Student(name: name, age: age, semester: semester),
                  );
                  _fetchStudents();
                } catch (e) {
                  setState(() {
                    errorMessage = 'Error adding student: $e';
                  });
                } finally {
                  Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editStudent(Student student) async {
    final TextEditingController nameController =
        TextEditingController(text: student.name);
    final TextEditingController ageController =
        TextEditingController(text: student.age.toString());
    final TextEditingController semesterController =
        TextEditingController(text: student.semester);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Semester'),
                controller: semesterController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext confirmationDialogContext) {
                    return AlertDialog(
                      title: Text('Confirm Update'),
                      content: Text(
                          'Are you sure you want to edit this student\'s data?'),
                      actions: [
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(confirmationDialogContext).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () async {
                            try {
                              await firebaseHelper.updateStudent(
                                student.id!,
                                Student(
                                  name: nameController.text,
                                  age: int.tryParse(ageController.text) ?? 0,
                                  semester: semesterController.text,
                                ),
                              );
                              _fetchStudents();
                            } catch (e) {
                              setState(() {
                                errorMessage = 'Error updating student: $e';
                              });
                            } finally {
                              Navigator.of(confirmationDialogContext).pop();
                              Navigator.of(dialogContext).pop();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(String id) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete Student'),
          content: Text('Are you sure you want to delete this student?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                try {
                  await firebaseHelper.deleteStudent(id);
                  _fetchStudents();
                } catch (e) {
                  setState(() {
                    errorMessage = 'Error deleting student: $e';
                  });
                } finally {
                  Navigator.of(dialogContext).pop();
                }
              },
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
        title: Text('Student Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addStudent,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text(
                          'Age: ${student.age}, Semester: ${student.semester}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editStudent(student),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteStudent(student.id!),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({required this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text(
          'Failed to initialize Firebase: $error',
          style: const TextStyle(fontSize: 20, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
