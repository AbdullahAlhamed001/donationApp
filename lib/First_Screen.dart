import 'package:demo_app/Second_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class First_Screen extends StatelessWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161D6F),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 78,
          ),
          Image.asset("assets/Group 46.png"),
          const SizedBox(
            height: 30,
          ),
          Text(" Let's help together ",
              style: GoogleFonts.philosopher(
                  textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFFFFFF)))),
          Text("in this pandemic!",
              style: GoogleFonts.philosopher(
                  textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)))),
          const SizedBox(
            height: 30.0,
          ),
          Text(
              "You can get medical and food service\n at your doorsteps and also anyone can\n donate some fund for covid patients.",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFFFFFF)))),
          const SizedBox(
            height: 75,
          ),
          Container(
            height: 210,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" Choose your category ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff282846)))),
                const SizedBox(
                  height: 31,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    Category(context, "assets/medicines.png", "Medical"),
                    const SizedBox(
                      width: 35,
                    ),
                    Category(context, "assets/hot-food.png", "Food"),
                    const SizedBox(
                      width: 35,
                    ),
                    Category(context, "assets/giving.png", "Donate")
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget Category(BuildContext context, String pixName, String txt) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Second_Screen(txt)),
      ),
      child: Column(
        children: [
          Image.asset(pixName),
          const SizedBox(
            height: 7,
          ),
          Text(txt,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff282846)))),
        ],
      ),
    );
  }
}
