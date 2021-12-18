import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column card(BuildContext context) {
  return Column(
    children: [
      Card(
        elevation: 0.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/image.webp",
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 125,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arvind Shukla",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "25 Years",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: ATColors.kGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  astrologersData(
                      "assets/icons/description.png",
                      "Coffe Cup Reading,\nKundli Grasg, Dosh, Vasthu,\nPlamshy, Face, nosos,\nReading, Tarrot",
                      false),
                  astrologersData(
                      "assets/icons/language.png", "English, Hindi", false),
                  astrologersData("assets/icons/price.png", "Rs.100/min", true),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Material(
                        elevation: 2,
                        child: Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/icons/phone.png",
                                height: 25,
                                width: 25,
                                color: Colors.white,
                              ),
                              Text(
                                "Talk on call",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: MediaQuery.of(context).size.width,
        height: 2,
        color: Colors.grey[300],
      ),
    ],
  );
}

Row astrologersData(String path, String text, bool flag) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Image.asset(
          path,
          width: 13,
          height: 13,
          fit: BoxFit.fill,
          color: Colors.orange,
        ),
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: ATColors.kGrey,
          fontWeight: (flag) ? FontWeight.bold : null,
        ),
      ),
    ],
  );
}
