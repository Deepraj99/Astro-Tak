import 'dart:async';
import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 7),
          height: 20,
          width: MediaQuery.of(context).size.width / (2.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/back.png",
                width: 18,
                height: 18,
                fit: BoxFit.fill,
                color: Colors.black,
              ),
              Text(
                "Daily Panchang",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "india is a country known for its festival but knowing the exact\ndates can sometimes be difficult. To ensure you do not miss out\non the critical dates we bring you the daily panchang.",
            style: GoogleFonts.poppins(
              fontSize: 11.5,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: MediaQuery.of(context).size.width,
              height: 140,
              color: Colors.orange[50],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 25, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Date:",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            color: Colors.white,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat(
                                        DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                    .format(currentDate)
                                    .toString()),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(27, 20, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Location:",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            color: Colors.white,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            padding: const EdgeInsets.fromLTRB(5, 7, 0, 0),
                            child: Text(
                              "Delhi, India",
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  card(),
                  card(),
                  card(),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.grey[400],
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tithi",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        texts("Tithi Numbar:", "13"),
                        texts("Tithi Name:", "Shukla Trayodashi"),
                        texts("Spacial:", "Jaya Tithi"),
                        texts("Summary:",
                            "Auspicious day to start important\nfulfillment wearing new clothes,\npleasures"),
                        texts("Delty:", "Cupid"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row texts(String str1, String str2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0.0,
          child: Container(
            width: 140,
            child: Text(
              str1,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: ATColors.kGrey,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width - 180,
            child: Text(
              str2,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: ATColors.kGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container card() {
    return Container(
      height: 40,
      width: 120,
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Row(
        children: [
          const Icon(Icons.access_alarm),
          const SizedBox(width: 5),
          Column(
            children: [
              Text(
                "Sunset",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                ),
              ),
              Text(
                "05:26 PM",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
