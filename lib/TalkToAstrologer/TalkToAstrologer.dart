import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:astro_tak/MenuItem.dart';
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

  // GlobalKey<ScaffoldState> _scaff = new GlobalKey<ScaffoldState>();
  // static const _popItem = <String>[
  //   "one",
  //   "Two",
  //   "Three",
  //   "Four",
  // ];
  // static final List<PopupMenuItem<String>> _pop = _popItem
  //     .map((String val) => PopupMenuItem<String>(
  //           value: val,
  //           child: Text(val),
  //         ))
  //     .toList();
  // late String value;

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
                width: MediaQuery.of(context).size.width / 5,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    options("assets/icons/search.png", searchItems),
                    options("assets/icons/filter.png", filters),
                    options("assets/icons/sort.png", sortLists),
                  ],
                ),
              ),
            ],
          ),
        ),
        buildSearch(),
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

  InkWell options(String url, Function fnc) {
    return InkWell(
      onTap: () => fnc,
      child: Image.asset(
        url,
        width: 20,
        height: 20,
        fit: BoxFit.fill,
      ),
    );
  }

  searchItems() {}

  filters() {}

  sortLists() {
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Row(
    //       children: [
    //         const Text(
    //           "PopUp Menu",
    //           style: TextStyle(
    //             fontSize: 30,
    //           ),
    //         ),
    //         PopupMenuButton(
    //           onSelected: (String val) {
    //             value = val;
    //           },
    //           itemBuilder: (BuildContext context) => _pop,
    //         ),
    //       ],
    //     ),
    //   ],
    // );
    // [
    //   PopupMenuButton(
    //     itemBuilder: (context) => [
    //       ...MenuItems.itemsFirst.map(buildItem).toList(),
    //     ],
    //   ),
    // ];
  }

  // PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
  //       child: Text(item.text),
  //     );
}
