import 'package:demo_app/Model/Meal.dart';
import 'package:demo_app/Three_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Second_Screen extends StatelessWidget {
  String txt;
  Second_Screen(this.txt, {Key? key}) : super(key: key);

  List<Meal> itemList = [];

  fillList() {
    if (txt == "Food") {
      itemList = [
        Meal("1 Meal ", 12, const Color(0xffFFC14F),
            "1 Veg Sabji, 1 Panner Sabji,\n4 Roti, 1 Sweet, Salad and \nButtermilk."),
        Meal("2 Meal ", 18, const Color.fromARGB(255, 255, 104, 104),
            " 2 Veg Sabji,2 Panner Sabji,\n 4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
        Meal("3 Meal ", 22, const Color(0xffFFC14F),
            " 2 Veg Sabji,  Panner Sabji,\n4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
      ];
    } else if (txt == "Donate") {
      itemList = [
        Meal("1 Donate ", 15, const Color.fromARGB(255, 188, 79, 255),
            " 1 Veg Sabji, 1 Panner Sabji,\n4 Roti, 1 Sweet, Salad and\n Buttermilk. "),
        Meal("2 Donate ", 22, const Color.fromARGB(255, 255, 79, 79),
            " 2 Veg Sabji,  Panner Sabji\n,4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
        Meal("3 Donate ", 22, const Color.fromARGB(255, 255, 79, 82),
            " 2 Veg Sabji,  Panner Sabji\n,4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
      ];
    } else {
      itemList = [
        Meal("1 Medical ", 14, const Color(0xffFFC14F),
            " 1 Veg Sabji, 1 Panner Sabji,\n4 Roti, 1 Sweet, Salad and\n Buttermilk. "),
        Meal("2 Medical ", 20, const Color.fromARGB(255, 255, 79, 170),
            " 2 Veg Sabji,2 Panner Sabji,\n 4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
        Meal("3 Medical ", 22, const Color.fromARGB(255, 188, 79, 255),
            " 3 Veg Sabji,  Panner Sabji,\n 4 Roti, 2 Sweet, Salad and\n Buttermilk. "),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    fillList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    HeaderWidget(context),
                    Column(
                      children: [
                        const SizedBox(
                          height: 170,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemList.length,
                                itemBuilder: (ctx, index) {
                                  return card(
                                      itemList[index], itemList, context);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 206),
                  child: Text(" Our Features ",
                      style: GoogleFonts.philosopher(
                          textStyle: const TextStyle(
                              color: Color(0xff161D6F),
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Cartchose("online-shop.png", " Order your \n meal online "),
                    const SizedBox(
                      width: 41,
                    ),
                    Cartchose("calendar.png", " Schedule as \n per your ease")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Cartchose("maps.png", " Track \n Deliver"),
                    const SizedBox(
                      width: 41,
                    ),
                    Cartchose("hot-food1.png", "      Enjoy a \n warm meal")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row card(Meal item, List<Meal> listofItem, BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 200,
          width: 205,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: item.background,
              image: const DecorationImage(
                  image: AssetImage("assets/Mask Group 1.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    item.name,
                    style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            color: Color(0xff161D6F),
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Row(
                  children: [
                    Text(
                      "   \$${item.price.toString()}",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff161D6F),
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "  /a day",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff161D6F),
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => threeScreen(txt, item)),
                  );
                }),
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Text(" View Details ",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff161D6F),
                                fontSize: 14,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container HeaderWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 235,
      decoration: const BoxDecoration(
          color: Color(0xff161D6F),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                  color: const Color(0xffFFFFFF),
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(Icons.arrow_back_ios_new)),
              Text(
                txt,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                width: 215,
              ),
              Image.asset("assets/Oval 2.png")
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
                " Select your plan and enjoy a warm lunch or dinner at your home. ",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.normal),
                )),
          )
        ],
      ),
    );
  }

  Container Cartchose(String pic, String txt) {
    return Container(
      height: 145,
      width: 145,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 249),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/${pic}",
            width: 42,
            height: 42,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(txt,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xff161D6F),
                      fontSize: 14,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
