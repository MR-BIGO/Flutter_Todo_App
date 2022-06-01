import 'package:flutter/material.dart';
import 'package:flutter_todo/data/model/todo.dart';
import 'package:flutter_todo/data/repository/todo_rep.dart';

class TodoProvider extends ChangeNotifier {
  final api = Api();

  late Future<List<Todo>> _futureTodo = api.fetchTodo();

  Future<List<Todo>> get futureTodo => _futureTodo;

  void getTodo() {
    _futureTodo = api.fetchTodo();
    notifyListeners();
  }

  void deleteTodo(int id) {
    api.deleteTodo(id);
    getTodo();
  }

  void addTodo(int id, String title, bool isDone, String description) {
    api.addTodo(id, title, isDone, description);
    getTodo();
  }

  void updateTodo(int id, String title, bool isDone, String description) {
    api.updateTodo(id, title, isDone, description);
    getTodo();
  }

  void todoDone(int id, bool isDone) {
    api.todoDone(id, isDone);
    getTodo();
  }
}
