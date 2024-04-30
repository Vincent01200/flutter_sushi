import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 24, 18),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Sashimi",
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            Image.asset("asset/image/japanese-food.png"),
            Text(
              "Sushi is a fast food",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 44,
              ),
            ),
            Text(
              "Come get the sushi",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/main");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 102, 95),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
