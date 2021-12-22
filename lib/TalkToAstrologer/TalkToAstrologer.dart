import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:astro_tak/Models/PostModels.dart';
import 'package:astro_tak/SearchWidget.dart';
import 'package:astro_tak/TalkToAstrologer/Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TalkToAstrologer extends StatefulWidget {
  const TalkToAstrologer({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerState createState() => _TalkToAstrologerState();
}

class _TalkToAstrologerState extends State<TalkToAstrologer> {
  late List<PostModelData> strologers = [];
  String query = "";
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<PostModelData> postList = [];
  Future<List<PostModelData>> getData() async {
    try {
      var res = await http
          .get(Uri.parse("https://www.astrotak.com/astroapi/api/agent/all"));
      var body = jsonDecode(res.body.toString());
      var model = PostModel.fromJson(body);
      postList = model.data;
      print(postList.length);
      setState(() {
        strologers = postList;
      });
    } catch (e) {
      return postList;
    }

    return postList;
  }

  //SearchIcon Visibility
  bool viewVisible = false;
  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
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
                width: 80,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (viewVisible == true) ? hideWidget : showWidget,
                      child: options("assets/icons/search.png"),
                    ),
                    InkWell(
                      onTap: () {},
                      child: options("assets/icons/filter.png"),
                    ),
                    InkWell(
                      onTap: () => _showPopupMenu(),
                      child: options("assets/icons/sort.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: viewVisible,
          child: buildSearch(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: strologers.length,
            itemBuilder: (context, index) {
              return card(
                context,
                strologers[index].firstName,
                strologers[index].lastName,
                strologers[index].images.medium.imageUrl,
                strologers[index].skills,
                strologers[index].languages,
                strologers[index].experience,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      hintText: "Search Astrologer",
      onChanged: searchStrologer,
      handleReset: () {
        setState(() {
          strologers = postList;
        });
      });
  searchStrologer(String query) {
    List<PostModelData> temp = postList
        .where((element) =>
            element.firstName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      strologers = temp;
    });
  }

  Widget options(String url) {
    return Image.asset(
      url,
      width: 20,
      height: 20,
      fit: BoxFit.fill,
    );
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem(
          value: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sort By",
                style: GoogleFonts.poppins(
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 1,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: popUpData("Experience- high to low"),
        ),
        PopupMenuItem(
          value: 3,
          child: popUpData("Experience- low to high"),
        ),
        PopupMenuItem(
          value: 4,
          child: popUpData("Price- high to low"),
        ),
        PopupMenuItem(
          value: 5,
          child: popUpData("Price- low to high"),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

      if (value != null) print(value);
    });
  }

  Row popUpData(String str) {
    return Row(
      children: [
        const Icon(Icons.circle_outlined, size: 20),
        const SizedBox(width: 20),
        Text(str, style: GoogleFonts.poppins()),
      ],
    );
  }
}
