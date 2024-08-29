import 'package:first_mini_project/4th%20Mini%20Project/controllers/database_controller.dart';
import 'package:first_mini_project/4th%20Mini%20Project/models/task.dart';
import 'package:flutter/material.dart';

class TaskController {
  static final titleController = TextEditingController();
  static final descriptionController = TextEditingController();
  static final _currentDateTime = DateTime.now();
  static late Future<List<Task>> tasks;

  static Future<List<Task>> getPendingTasks() async {
    List<Task> pendingTasks = await DatabaseController.getTasks();
    pendingTasks.removeWhere((element) => element.status == 1);
    return pendingTasks;
  }

  static Future<List<Task>> getDoneTasks() async {
    List<Task> doneTasks = await DatabaseController.getTasks();
    doneTasks.removeWhere((element) => element.status == 0);
    return doneTasks;
  }

  static void updateTaskStatus(
      int taskId, String todoTitle, String todoDescription) {
    Task task = Task(
      id: taskId,
      title: todoTitle.trim(),
      description: todoDescription.trim(),
      date:
          "${_currentDateTime.day}/${_currentDateTime.month}/${_currentDateTime.year}",
      time: "${_currentDateTime.hour}:${_currentDateTime.minute}",
      status: 1,
    );
    DatabaseController.update(task, taskId)
        .then((value) => tasks = DatabaseController.getTasks());
  }

  static Future<void> addTask() async {
    Task task = Task(
      title: titleController.text,
      description: descriptionController.text,
      date:
          "${_currentDateTime.day}/${_currentDateTime.month}/${_currentDateTime.year}",
      time: "${_currentDateTime.hour}:${_currentDateTime.minute}",
      status: 0,
    );

    await DatabaseController.insert(task)
        .then((value) => tasks = DatabaseController.getTasks());
    titleController.clear();
    descriptionController.clear();
  }

  static void updateTask(int taskId) {
    Task task = Task(
      id: taskId,
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      time: "${DateTime.now().hour}:${DateTime.now().minute}",
      status: 0,
    );

    DatabaseController.update(task, taskId)
        .then((value) => tasks = DatabaseController.getTasks());
    titleController.clear();
    descriptionController.clear();
  }

  static Future<List<Task>> searchPendingTasksByTitle(String title) async {
    List<Task> pendingTasks = await getPendingTasks();
    if (title == "" || title.isEmpty) {
      return pendingTasks;
    }
    pendingTasks.removeWhere((element) =>
        !element.title!.toLowerCase().contains(title.toLowerCase()));
    return pendingTasks;
  }

  static Future<List<Task>> searchDoneTasksByTitle(String title) async {
    List<Task> doneTasks = await getDoneTasks();
    if (title == "" || title.isEmpty) {
      return doneTasks;
    }
    doneTasks.removeWhere((element) =>
        !element.title!.toLowerCase().contains(title.toLowerCase()));
    return doneTasks;
  }
}
