import 'dart:convert';

import 'package:minimal_todo_list_app/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  List<Task> _tasks = [];

  int count() {
    return _tasks.length;
  }

  Task findByIndex(int index) {
    return _tasks[index];
  }

  void getTask() async {
    var prefs = await SharedPreferences.getInstance();
    var target = prefs.getStringList('tasks') ?? [];

    // StringList => Json => Map => TodoListに変換
    _tasks = target.map((m) => Task.fromJson(json.decode(m))).toList();
  }

  void saveTask() async {
    var prefs = await SharedPreferences.getInstance();

    // TodoList => Map => Json => StringListに変換
    var target = _tasks.map((m) => json.encode(m)).toList();
    prefs.setStringList('tasks', target);
  }

  void addTask(String taskName, bool taskCompleted,) {
    int id;

    if(count() == 0) {
      id = 1;
    } else {
      id = _tasks.last.id + 1;
    }

    var tasks = Task(id, taskName, taskCompleted);
    _tasks.add(tasks);
    saveTask();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    saveTask();
  }

  void updateTask(Task tasks, bool taskCompleted, [String? taskName]) {
    tasks.taskCompleted = taskCompleted;

    if (taskName != null) {
      tasks.taskName = taskName;
    }

    saveTask();
  }
}