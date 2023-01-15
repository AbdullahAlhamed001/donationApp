// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

enum PaymentMethoed { Credit, Paypal, Google, none }

class FourthScreen extends StatefulWidget {
  FourthScreen(this.lastPrice, {Key? key}) : super(key: key);
  int lastPrice;
  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  PaymentMethoed selectedType = PaymentMethoed.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      color: const Color(0xff161D6F),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Billing Detail",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff161D6F))),
                  ),
                  const Expanded(child: SizedBox()),
                  Image.asset(
                    "assets/Group 79.png",
                    height: 24,
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              BoxCard("Credit/Debit Card",
                  selectedType == PaymentMethoed.Credit, 130),
              const SizedBox(
                height: 20,
              ),
              BoxCard("Paypal", selectedType == PaymentMethoed.Paypal, 220),
              const SizedBox(
                height: 20,
              ),
              BoxCard("Google Pay", selectedType == PaymentMethoed.Google, 185),
              Expanded(child:const SizedBox()),
              SliderButton(
                backgroundColor: const Color(0xffFFC14F),
                height: 60,
                width: 370,
                disable: false,
                highlightedColor: const Color(0xff161D6F),
                baseColor: const Color(0xff161D6F),
                action: () {
                  ///Do something here
                },
                label: Text("\$${widget.lastPrice}",
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
                          Text(" Checkout",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                              "assets/Icons - Arrow - Arrowhead - Right.png")
                        ],
                      ),
                    ),
                    /*  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text("\$${lastPrice}",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff161D6F),
                                fontWeight: FontWeight.bold,
                                fontSize: 24))),
                  ),*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell BoxCard(String payName, bool checked, double size) {
    return InkWell(
      onTap: () {
        if (payName == "Credit/Debit Card") {
          selectedType = PaymentMethoed.Credit;
        } else if (payName == "Paypal") {
          selectedType = PaymentMethoed.Paypal;
        } else if (payName == "Google Pay") {
          selectedType = PaymentMethoed.Google;
        } else {
          selectedType = PaymentMethoed.none;
        }
        setState(() {});
      },
      child: Container(
        width: 360,
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xffF5F6F9),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              payName,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff161D6F))),
            ),
            SizedBox(
              width: size,
            ),
            Image.asset(
              checked
                  ? "assets/Icons - Radio - Button On.png"
                  : "assets/Icons - Radio - Button Of.png",
              height: 24,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
