import 'package:astro_tak/TalkToAstrologer/Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column talkToAstrologer(BuildContext context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 5),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 30,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Talk to an Astrologer",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  options("assets/icons/search.png"),
                  options("assets/icons/filter.png"),
                  options("assets/icons/sort.png"),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Material(
          elevation: 2,
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: const BoxDecoration(
              color: Colors.white24,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/search.png",
                  width: 15,
                  height: 15,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 15),
                Text(
                  "Search Astrologer",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 160),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/icons/close.png",
                    width: 12,
                    height: 12,
                    fit: BoxFit.fill,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              card(context),
              card(context),
            ],
          ),
        ),
      ),
    ],
  );
}

InkWell options(String url) {
  return InkWell(
    onTap: () {},
    child: Image.asset(
      url,
      width: 20,
      height: 20,
      fit: BoxFit.fill,
    ),
  );
}
