import 'dart:convert';
import 'dart:core';
import 'package:astro_tak/Models/PostModels.dart';
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
  late List<PostModelData> postList;
  Future<List<PostModelData>> getData() async {
    try {
      var res = await http
          .get(Uri.parse("https://www.astrotak.com/astroapi/api/agent/all"));
      var body = jsonDecode(res.body.toString());

      var model = PostModel.fromJson(body);
      postList = model.data;
    } catch (e) {
      print("err: ");
      print(e);
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
        Container(
          decoration: BoxDecoration(
            color: Color(0xfff5f8fd),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Astrologer",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.search),
            ],
          ),
        ),
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
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading");
              } else {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return card(
                      context,
                      postList[index].firstName,
                      postList[index].lastName,
                      postList[index].images.medium.imageUrl,
                      postList[index].skills,
                      postList[index].languages,
                      postList[index].experience,
                    );
                  },
                );
              }
            },
          ),
        ),
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
