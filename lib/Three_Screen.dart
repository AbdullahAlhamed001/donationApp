import 'package:demo_app/Fourth_Screen.dart';
import 'package:demo_app/Model/Meal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

class threeScreen extends StatefulWidget {
  Meal item;
  String txt;
  threeScreen(this.txt, this.item, {Key? key}) : super(key: key);

  @override
  State<threeScreen> createState() => _threeScreenState();
}

class _threeScreenState extends State<threeScreen> {
  bool selectedLunchtype = false;

  bool selectedDinnertype = false;
  final item = ['1 Meal ', ' 2 Meal ', ' 3  Meal'];
  String? value;

  int lastPrice = 0;

  @override
  Widget build(BuildContext context) {
    if (selectedLunchtype == true && selectedDinnertype == true) {
      lastPrice = widget.item.price * 2;
      setState(() {});
    } else if (selectedLunchtype == true || selectedDinnertype == true) {
      lastPrice = widget.item.price;
      setState(() {});
    } else if (selectedLunchtype == false || selectedDinnertype == false) {
      lastPrice = widget.item.price * 0;
      setState(() {});
    }
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              HiderWidget(context),
              const SizedBox(
                height: 30,
              ),
              CalnderSet(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 315,
                height: 250,
                decoration: const BoxDecoration(color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckBoxs(),
              const SizedBox(
                height: 20,
              ),
              Slider(context)
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Center Slider(BuildContext context , ) {
    return Center(
        child: SliderButton(
      backgroundColor: const Color(0xffFFC14F),
      height: 60,
      width: 370,
      disable: false,
      highlightedColor: const Color(0xff161D6F),
      baseColor: const Color(0xff161D6F),
      action: () {
        ///Do something here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FourthScreen(lastPrice)),
        );
      },
      label: Text("\$${lastPrice}",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color(0xff161D6F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24))),
      child: Row(
        children: [
          Container(
            width: 230,
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0xff161D6F),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(" Book Now ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                const SizedBox(
                  width: 20,
                ),
                Image.asset("assets/Icons - Arrow - Arrowhead - Right.png")
              ],
            ),
          ),
          
        ],
      ),
    ));
  }

  Row CheckBoxs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 35),
        CustomChcekBox(
            selectedLunchtype == true
                ? "Icons - Checkmark - Square 2.png"
                : "Icons - Square.png",
            "Lunch"),
        const SizedBox(
          width: 30,
        ),
        CustomChcekBox(
            selectedDinnertype == true
                ? "Icons - Checkmark - Square 2.png"
                : "Icons - Square.png",
            "Dinner")
      ],
    );
  }

  Row CalnderSet() {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Text(" Select Days ",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff282846)))),
        const SizedBox(
          width: 200,
        ),
        Image.asset("assets/Color.png")
      ],
    );
  }

  InkWell CustomChcekBox(String assets, String name) {
    return InkWell(
      onTap: () {
        if (name == "Lunch") {
          selectedLunchtype = !selectedLunchtype;
        } else {
          selectedDinnertype = !selectedDinnertype;
        }
        setState(() {});
      },
      child: Container(
        width: 143,
        height: 50,
        decoration: const BoxDecoration(
            color: Color(0xffF5F6F9),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/${assets}"),
            const SizedBox(
              width: 15,
            ),
            Text(name,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff282846))))
          ],
        ),
      ),
    );
  }

  Container HiderWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 235,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/Mask Group 1.png")),
          color: widget.item.background,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: const Color(0xff161D6F),
              ),
              Text("${widget.txt} Plan",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff282846)))),
              const Expanded(child: SizedBox()),
              Image.asset(
                "assets/Group 79.png",
                height: 24,
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                "assets/meal.png",
                height: 110,
                width: 100,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: Text(widget.item.name,
                            style: GoogleFonts.philosopher(
                                textStyle: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff282846)))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(widget.item.description,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff282846)))),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
