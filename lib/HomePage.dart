import 'package:astro_tak/TalkToAstrologer/AppBar.dart';
import 'package:astro_tak/TalkToAstrologer/TalkToAstrologer.dart';
import 'package:astro_tak/TalkToAstrologer/ButtomNavigationBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const Drawer(),
      body: talkToAstrologer(context),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}
