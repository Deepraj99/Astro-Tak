import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({Key? key}) : super(key: key);
  @override
  _ButtomNavigationBarState createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ATColors.kOrange,
      backgroundColor: Colors.white,
      unselectedFontSize: 8,
      selectedFontSize: 8,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/home.png")),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/talk.png")),
          label: "Talk To Astrologer",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/ask.png")),
          label: "Ask Qusestions",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/reports.png")),
          label: "Reports",
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
