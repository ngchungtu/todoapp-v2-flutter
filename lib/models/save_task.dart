import 'package:flutter/material.dart';
import 'package:todo_app_v2/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: "Lau nha", isCompleted: false),
    Task(title: "Mua cafe", isCompleted: false),
    Task(title: "Chay xe", isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    tasks[index].toggleCompletion();
    notifyListeners();
  }
}
