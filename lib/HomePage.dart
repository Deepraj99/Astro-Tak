import 'package:astro_tak/Home/Home.dart';
import 'package:astro_tak/AppBar.dart';
import 'package:astro_tak/TalkToAstrologer/TalkToAstrologer.dart';
import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Different screens
  int _currentIndex = 1;
  final screens = [
    const Home(),
    const TalkToAstrologer(),
    const Center(child: Text("Ask Question", style: TextStyle(fontSize: 25))),
    const Center(child: Text("Reports", style: TextStyle(fontSize: 25))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const Drawer(),
      body: screens[_currentIndex],
      bottomNavigationBar: buttomNavigationBar(),
      floatingActionButton:
          (_currentIndex == 0) ? floatingActionButton() : null,
    );
  }

  //FloatingActionButton
  Widget floatingActionButton() {
    return Align(
      alignment: const Alignment(1, 0.9),
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        tooltip: 'Increment',
        child: Image.asset(
          "assets/icons/bar.png",
          height: 25,
          width: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  //BottomNavigationBar
  BottomNavigationBar buttomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ATColors.kOrange,
      backgroundColor: Colors.white,
      unselectedFontSize: 8,
      selectedFontSize: 8,
      items: (_currentIndex != 0)
          ? const [
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
            ]
          : const [
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
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/chat.png")),
                label: "Chat with Austrologer",
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
