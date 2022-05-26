import 'package:dio/dio.dart';
import 'package:flutter_todo/data/model/todo.dart';

class Api {
  Dio dio = Dio();

  Future<List<Todo>> fetchTodo() async {
    try {
      final response = await dio.get('http://10.0.2.2:8080/todos');
      List<Todo>? todoList = [];
      if (response.statusCode == 200) {
        response.data.forEach((todo) {
          todoList.add(Todo.fromJson(todo));
        });
      }
      return todoList;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteTodo(int id) async {
    String url = 'http://10.0.2.2:8080/delete-todo/' + id.toString();
    try {
      await dio.delete(url);
    } catch (e) {
      throw Exception(e);
    }
  }

  addTodo(int id, String title, bool isDone, String description) async {
    String url = 'http://10.0.2.2:8080/add-todo';
    try {
      await dio.post(url, data: {
        'id': id,
        'todo': title,
        'isDone': isDone,
        'description': description,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  updateTodo(int id, String title, bool isDone, String description) async {
    String url = 'http://10.0.2.2:8080/update-todo';
    try {
      await dio.put(url, data: {
        'id': id,
        'todo': title,
        'isDone': isDone,
        'description': description,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  todoDone(int id, bool isDone) async {
    String url = 'http://10.0.2.2:8080/todo-done/' + id.toString();
    try {
      await dio.patch(url, data: {
        'isDone': isDone,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
