import 'package:flutter/material.dart';
import 'package:flutter_todo/logic/todo_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

final _formKey = GlobalKey<FormState>();

TextEditingController newID = TextEditingController();
TextEditingController newTitle = TextEditingController();
TextEditingController newDescription = TextEditingController();

class BuildAddSheet extends StatelessWidget {
  const BuildAddSheet({Key? key}) : super(key: key);

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
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              maxLines: null,
              minLines: null,
              controller: newID,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                hintText: 'Please enter ID',
              ),
              keyboardType: TextInputType.number,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter a valid ID";
                }

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                maxLines: null,
                minLines: null,
                controller: newTitle,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    hintText: 'Please enter title'),
                keyboardType: TextInputType.text,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please, enter a valid title";
                  }
                  return null;
                },
              ),
            ),
            TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              maxLines: null,
              minLines: null,
              controller: newDescription,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  hintText: 'Please enter task details'),
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter valid task details";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  height: 40,
                  child: FloatingActionButton(
                    heroTag: "addBtn",
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    backgroundColor: Colors.white,
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              letterSpacing: 0,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff04a3a3))),
                    ),
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          context.read<TodoProvider>().addTodo(
                              int.parse(newID.text),
                              newTitle.text,
                              false,
                              newDescription.text);
                        }
                        Navigator.pop(context);
                      } catch (e) {
                        throw Exception(e);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
