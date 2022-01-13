import 'package:flutter/material.dart';
import 'package:flutter_todo/data/barrels/rep_barrel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_bottom_sheet.dart';

class BuildDetailsSheet extends StatelessWidget {
  const BuildDetailsSheet(
      {Key? key,
      required this.id,
      required this.title,
      required this.isDone,
      required this.description})
      : super(key: key);

  final int id;
  final String title;
  final bool isDone;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      color: const Color(0xff04a3a3),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color(0xff6CB4B1),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color(0xff6CB4B1),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => BuildEditSheet(
                              id: id,
                              title: title,
                              isDone: isDone,
                              description: description,
                            )).then((_) {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color(0xff6CB4B1),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    deleteTodo(id).then((_) {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ],
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
                          color: Color(0xff04a3a3)),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
