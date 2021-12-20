import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:astro_tak/AstrologersApi.dart';
import 'package:astro_tak/Models/PostModels.dart';
import 'package:astro_tak/SearchWidget.dart';
import 'package:astro_tak/TalkToAstrologer/Card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class TalkToAstrologer extends StatefulWidget {
  const TalkToAstrologer({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerState createState() => _TalkToAstrologerState();
}

class _TalkToAstrologerState extends State<TalkToAstrologer> {
  // final controller = TextEditingController();
  late List<PostModelData> strologers = [];
  String query = "";
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // final TextEditingController filter = new TextEditingController();
  // final dio = new Dio(); //to making http request
  // String _searchText = "";
  // List<Card> names = [];
  // List<Card> filteredNames = [];

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
                    options("assets/icons/search.png"),
                    options("assets/icons/filter.png"),
                    options("assets/icons/sort.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
        buildSearch(),
        //search bar
        // Container(
        //   decoration: BoxDecoration(
        //     color: Color(0xfff5f8fd),
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   padding: EdgeInsets.symmetric(horizontal: 24),
        //   margin: EdgeInsets.symmetric(horizontal: 24),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: TextField(
        //           controller: controller,
        //           decoration: InputDecoration(
        //             icon: Icon(Icons.search),
        //             hintText: "Search Astrologer",
        //             border: InputBorder.none,
        //           ),
        //         ),
        //       ),
        //       Icon(Icons.search),
        //     ],
        //   ),
        // ),
        // Container(
        //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        //   child: Material(
        //     elevation: 2,
        //     child: Container(
        //       height: 40,
        //       width: MediaQuery.of(context).size.width,
        //       padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        //       decoration: const BoxDecoration(
        //         color: Colors.white24,
        //       ),
        //       child: Row(
        //         children: [
        //           Image.asset(
        //             "assets/icons/search.png",
        //             width: 15,
        //             height: 15,
        //             fit: BoxFit.fill,
        //           ),
        //           const SizedBox(width: 15),
        //           Text(
        //             "Search Astrologer",
        //             style: GoogleFonts.poppins(
        //               fontSize: 12,
        //               color: Colors.grey,
        //             ),
        //           ),
        //           const SizedBox(width: 160),
        //           GestureDetector(
        //             onTap: () {},
        //             child: Image.asset(
        //               "assets/icons/close.png",
        //               width: 12,
        //               height: 12,
        //               fit: BoxFit.fill,
        //               color: Colors.orange,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
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
        )),
        // Container(
        //   margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         card(context),
        //         card(context),
        //       ],
        //     ),
        //   ),
        // ),
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
}
