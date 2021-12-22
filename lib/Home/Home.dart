import 'dart:async';
import 'dart:convert';
import 'package:astro_tak/Models/LocationPostModels.dart';
import 'package:astro_tak/Models/PanchangModelData.dart';
import 'package:astro_tak/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentDate = DateTime.now();
  late PanchangData panchang;

  @override
  void initState() {
    super.initState();

    getData();
    getPanchangData();
  }

  late String selectedLocation;
  late List<String> lcnData;
  late List<LocationData> postList = [];
  late List<LocationData> location = [];
  Future<List<LocationData>> getData() async {
    try {
      var res = await http.get(Uri.parse(
          "https://www.astrotak.com/astroapi/api/location/place?inputPlace=Delhi"));
      var body = jsonDecode(res.body.toString());
      var model = LocationPostModel.fromJson(body);
      postList = model.data;
      setState(() {
        location = postList;
        print(location[0].placeName);
        selectedLocation = location[0].placeName.toString();
        lcnData = [
          location[0].placeName.toString(),
          location[1].placeName.toString(),
          location[2].placeName.toString(),
          location[3].placeName.toString(),
          location[4].placeName.toString(),
        ];
      });
    } catch (e) {
      print("error");
      return postList;
    }

    return postList;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  //Panchang api
  var model;
  getPanchangData() async {
    try {
      var res = await http.post(
        Uri.parse(
            'https://www.astrotak.com/astroapi/api/horoscope/daily/panchang'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'day': "2",
          'month': '7',
          'year': "2021",
          'placeId': "ChIJL_P_CXMEDTkRw0ZdG-0GVvw"
        }),
      );

      var body = jsonDecode(res.body.toString());
      model = PanchangPostModel.fromJson(body);
      setState(() {
        panchang = model.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 7),
          height: 20,
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/back.png",
                width: 18,
                height: 18,
                fit: BoxFit.fill,
                color: Colors.black,
              ),
              Text(
                "Daily Panchang",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          width: width,
          child: SizedBox(
            width: width,
            height: 60,
            child: Card(
              color: ATColors.kWhite,
              elevation: 0.0,
              child: Text(
                "india is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang.",
                style: GoogleFonts.poppins(
                  fontSize: 11.5,
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: width,
              height: height * 2 / 11,
              color: Colors.orange[50],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 25, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Date:",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Stack(
                          children: [
                            Container(
                              width: width / 1.5,
                              height: 40,
                              color: Colors.white,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                              width: width / 1.5,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat(DateFormat
                                          .YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                      .format(currentDate)
                                      .toString()),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                      height: 40,
                      width: 60,
                      alignment: Alignment.topRight,
                      child: Text(
                        "Location:",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: width / 1.5,
                          height: 40,
                          margin: const EdgeInsets.fromLTRB(20, 16, 0, 0),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 4, 0, 5),
                          width: width / 1.35,
                          height: 70,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSearchBox: true,
                            items: lcnData,
                            onChanged: print,
                            selectedItem: selectedLocation,
                            dropdownSearchDecoration: const InputDecoration(
                              border: InputBorder.none,
                              iconColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  card(true),
                  card(false),
                  card(true),
                  card(false),
                  card(true),
                  card(false),
                  card(true),
                  card(false),
                  card(true),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.grey[400],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return newCard(
                context,
                panchang.tithi.details.tithiNumber.toString(),
                panchang.tithi.details.tithiName.toString(),
                panchang.tithi.details.special.toString(),
                panchang.tithi.details.summary.toString(),
                panchang.tithi.details.deity.toString(),
                panchang.tithi.endTime.hour.toString() +
                    " hr " +
                    panchang.tithi.endTime.minute.toString() +
                    " min " +
                    panchang.tithi.endTime.second.toString() +
                    " sec",
              );
            },
          ),
        ),
      ],
    );
  }

  Widget newCard(BuildContext context, String tithiNumber, String tithiName,
      String special, String summary, String deity, String endTime) {
    return Card(
      color: ATColors.kWhite,
      elevation: 0.0,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tithi",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            texts("Tithi Numbar:", tithiNumber),
            texts("Tithi Name:", tithiName),
            texts("Spacial:", special),
            texts("Summary:", summary),
            texts("Delty:", deity),
            texts("End Time:", endTime),
          ],
        ),
      ),
    );
  }

  Row texts(String str1, String str2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: ATColors.kWhite,
          elevation: 0.0,
          child: Container(
            width: 140,
            child: Text(
              str1,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: ATColors.kGrey,
              ),
            ),
          ),
        ),
        Card(
          color: ATColors.kWhite,
          elevation: 0.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 180,
            child: Text(
              str2,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: ATColors.kGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container card(bool flag) {
    return Container(
      height: 40,
      width: 120,
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Row(
        children: [
          (flag)
              ? const Icon(Icons.wb_sunny, color: Color(0xFF737CA1))
              : const Icon(Icons.star_border, color: Color(0xFF737CA1)),
          const SizedBox(width: 5),
          Column(
            children: [
              Text(
                flag ? "Sunset" : "Stars",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: const Color(0xFF737CA1),
                ),
              ),
              Text(
                flag ? "01:26 PM" : "11:20 PM",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
