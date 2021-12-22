import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: ATColors.kWhite,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset(
              "assets/icons/hamburger.png",
              width: 20,
              height: 18,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Image.asset(
          "assets/icons/logo.png",
          width: 50,
          height: 40,
          fit: BoxFit.fill,
        ),
        Image.asset(
          "assets/icons/profile.png",
          width: 22,
          height: 22,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}
