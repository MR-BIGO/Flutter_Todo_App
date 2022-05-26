import 'package:flutter/material.dart';
import 'package:flutter_todo/logic/todo_provider.dart';
import 'package:flutter_todo/presentation/screens/todo_screen.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoScreen(),
      title: 'todo_app',
    );
  }
}
