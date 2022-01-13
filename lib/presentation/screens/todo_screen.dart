import 'package:flutter/material.dart';
import 'package:flutter_todo/data/barrels/rep_barrel.dart';
import 'package:flutter_todo/data/barrels/sheet_barrel.dart';
import 'package:flutter_todo/presentation/widgets/list_item.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin {
  late Future<List<Todo>> futureTodo;

  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    futureTodo = fetchTodo();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..forward();
    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Todo>>(
        future: futureTodo,
        builder: (context, snapshot) {
          List<Todo> todos = [];
          if (snapshot.hasData) {
            todos = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'TODO APP',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600])),
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xff04a3a3),
                        child: const Icon(Icons.add),
                        elevation: 0,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => buildAddSheet(),
                          ).then((_) => Navigator.of(context).pop());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        child: SlideTransition(
                          position: offsetAnimation,
                          child: ListView.builder(
                              itemCount: todos.length,
                              itemBuilder: (context, index) {
                                final currentTodo = todos[index];
                                return GestureDetector(
                                  onLongPress: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => BuildEditSheet(
                                              id: currentTodo.id,
                                              title: currentTodo.title,
                                              isDone: currentTodo.isDone,
                                              description:
                                                  currentTodo.description,
                                            ));
                                  },
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => BuildDetailsSheet(
                                              id: currentTodo.id,
                                              title: currentTodo.title,
                                              isDone: currentTodo.isDone,
                                              description:
                                                  currentTodo.description,
                                            ));
                                  },
                                  child: ListItem(
                                    title: currentTodo.title,
                                    task: currentTodo.description,
                                    isDone: currentTodo.isDone,
                                  ),
                                );
                              }),
                        ),
                        decoration: const ShapeDecoration(
                          color: Color(0xff6CB4B1),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        height: double.infinity,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
