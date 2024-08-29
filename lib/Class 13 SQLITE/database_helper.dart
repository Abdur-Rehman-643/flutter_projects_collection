import 'dart:io';

import 'package:first_mini_project/Class 13 SQLITE/student.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? db;

  static const String tableName = 'students';
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colAge = 'age';
  static const String colSemester = 'semester';

  Future<void> init() async {
    try {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      String dirPath = appDocumentsDir.path;
      String dbPath = join(dirPath, 'students.db');

      db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          try {
            await db.execute(
              'CREATE TABLE $tableName ($colId INTEGER PRIMARY KEY, $colName TEXT, '
              '$colAge INTEGER, $colSemester TEXT);',
            );
          } catch (e) {
            print('Error creating table: $e');
            rethrow;
          }
        },
      );
    } catch (e) {
      print('Error opening database: $e');
      rethrow;
    }
  }

  Future<void> saveStudentRecord(Student student) async {
    try {
      await db!.insert(tableName, student.toJson());
    } catch (e) {
      print('Error inserting student record: $e');
    }
  }

  Future<void> removeStudentRecord(int id) async {
    try {
      await db!.delete(
        tableName,
        where: '$colId = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting student record: $e');
    }
  }

  Future<List<Student>> getAllStudents() async {
    List<Student> studentsList = [];
    try {
      List<Map<String, dynamic>> allRows = await db!.query(tableName);
      for (var row in allRows) {
        studentsList.add(Student.fromJson(row));
      }
    } catch (e) {
      print('Error querying all students: $e');
    }
    return studentsList;
  }

  Future<void> editStudentRecord(int id, Student student) async {
    try {
      await db!.update(
        tableName,
        {
          colName: student.name,
          colAge: student.age,
          colSemester: student.semester,
        },
        where: '$colId = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error updating student record: $e');
    }
  }
}
