import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'todo_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                width: 180,
                child:
                    Image(image: AssetImage('assets/images/asset_image.png'))),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
              child: SizedBox(
                width: 200,
                height: 40,
                child: FloatingActionButton(
                  heroTag: "btn0",
                  backgroundColor: const Color(0xff6CB4B1),
                  elevation: 0,
                  onPressed: () {},
                  child: const Text(''),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: const Color(0xff6CB4B1),
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoScreen()));
                },
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: -1,
                  )),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
