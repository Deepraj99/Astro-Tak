import 'package:astro_tak/Models/AstrologerPostModels.dart';
import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column card(
    BuildContext context,
    String firstName,
    String lastName,
    String imgUrl,
    List<Skills> skill,
    List<Languages> languages,
    num experience) {
  String lang = "", skills = "";
  for (int i = 0; i < skill.length; i++) {
    skills += skill[i].name.toString() + ", ";
  }
  for (int i = 0; i < languages.length; i++) {
    lang += languages[i].name.toString();
    lang += ", ";
  }
  return Column(
    children: [
      Card(
        elevation: 0.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imgUrl,
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 85,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          firstName + " " + lastName,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          experience.ceil().toString() + " Years",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: ATColors.kGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  astrologersData(
                      "assets/icons/description.png", skills, false),
                  astrologersData("assets/icons/language.png", lang, false),
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
      Card(
        elevation: 0.0,
        child: SizedBox(
          width: 250,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: ATColors.kGrey,
              fontWeight: (flag) ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    ],
  );
}
