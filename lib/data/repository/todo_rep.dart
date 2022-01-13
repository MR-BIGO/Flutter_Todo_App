import 'package:dio/dio.dart';
import 'package:flutter_todo/data/model/todo.dart';

Future<List<Todo>> fetchTodo() async {
  Dio dio = Dio();
  final response = await dio.get('http://10.0.2.2:8080/todos');
  List<Todo>? todoList = [];
  if (response.statusCode == 200) {
    response.data.forEach((todo) {
      todoList.add(Todo.fromJson(todo));
    });
  }
  return todoList;
}

deleteTodo(int id) async {
  Dio dio = Dio();
  String url = 'http://10.0.2.2:8080/delete-todo/' + id.toString();
  try{  
  await dio.delete(url);
  }catch(e){
    print(e);
  }
}

addTodo(int id, String title, bool isDone, String description) async {
  Dio dio = Dio();
  String url = 'http://10.0.2.2:8080/add-todo';
  try{
  await dio.post(url, data: {
    'id': id,
    'todo': title,
    'isDone': isDone,
    'description': description,
  
  });
  }catch(e){
    print(e);
  }
}

updateTodo(int id, String title, bool isDone, String description) async {
  Dio dio = Dio();
  String url = 'http://10.0.2.2:8080/update-todo/' + id.toString();
  try{
  await dio.put(url, data: {
    'id': id,
    'todo': title,
    'isDone': isDone,
    'description': description,
  });
  }catch(e){
    print(e);
  }
}
