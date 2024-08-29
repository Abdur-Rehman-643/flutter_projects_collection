import 'package:firebase_database/firebase_database.dart';
import 'package:first_mini_project/5th%20Mini%20Project/models/task.dart';

class FirebaseHelper {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('tasks');

  Future<void> addTask(Task task) async {
    try {
      final id = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Generate a unique ID
      await _database.child(id).set(task.toJson());
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> updateTask(String id, Task task) async {
    try {
      await _database.child(id).update(task.toJson());
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  // Delete a task
  Future<void> deleteTask(String id) async {
    try {
      await _database.child(id).remove();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Future<List<Task>> getAllTasks() async {
    List<Task> tasksList = [];
    try {
      final snapshot = await _database.once();
      final Map<dynamic, dynamic>? tasksMap = snapshot.snapshot.value as Map?;
      if (tasksMap != null) {
        tasksMap.forEach((key, value) {
          // Convert dynamic to Map<String, dynamic>
          final taskJson = Map<String, dynamic>.from(value);
          final task = Task.fromJson(taskJson);
          task.id = int.parse(key)
              as String?; // Convert Firebase key to int and assign to task ID
          tasksList.add(task);
        });
      }
    } catch (e) {
      print('Error fetching tasks: $e');
    }
    return tasksList;
  }
}
