import 'package:flutter/material.dart';
import 'package:flutter_todo/logic/todo_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.task,
    required this.isDone,
    required this.index,
  }) : super(key: key);

  final String title;
  final String task;
  final bool isDone;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          subtitle: Text(
            task,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          trailing: SizedBox(
            width: 40,
            height: 40,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor:
                  isDone ? const Color(0xff0ECC57) : Colors.grey[500],
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<TodoProvider>().todoDone(index, !isDone);
              },
            ),
          ),
        ),
      ),
    );
  }
}
