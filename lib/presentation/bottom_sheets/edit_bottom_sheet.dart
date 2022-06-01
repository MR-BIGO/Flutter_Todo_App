import 'package:flutter/material.dart';
import 'package:flutter_todo/logic/todo_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class BuildEditSheet extends StatefulWidget {
  const BuildEditSheet({
    Key? key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.description,
  }) : super(key: key);

  final int id;
  final String title;
  final bool isDone;
  final String description;

  @override
  State<BuildEditSheet> createState() => _BuildEditSheetState();
}

class _BuildEditSheetState extends State<BuildEditSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController editID =
      TextEditingController(text: widget.id.toString());
  late TextEditingController editTitle =
      TextEditingController(text: widget.title);
  late TextEditingController editDescription =
      TextEditingController(text: widget.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      color: const Color(0xff04a3a3),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.white,
              maxLines: null,
              minLines: null,
              autocorrect: false,
              controller: editID,
              //initialValue: currentID.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter a valid ID";
                }

                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.white,
              maxLines: null,
              minLines: null,
              autocorrect: false,
              controller: editTitle,
              //initialValue: currentTitle.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter a valid title";
                }

                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.white,
              maxLines: null,
              minLines: null,
              autocorrect: false,
              controller: editDescription,
              //initialValue: currentDescription.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter valid description";
                }

                return null;
              },
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: FloatingActionButton(
                heroTag: "editBtn",
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                backgroundColor: Colors.white,
                child: Text(
                  'EDIT',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      letterSpacing: 0,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff04a3a3),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TodoProvider>().updateTodo(
                        int.parse(editID.text),
                        editTitle.text,
                        false,
                        editDescription.text);
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
