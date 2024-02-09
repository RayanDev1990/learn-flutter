import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:project/pray.dart";

class PrayTimes extends StatefulWidget {
  const PrayTimes({super.key});

  @override
  State<PrayTimes> createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  late Pray pray;

  Future getPrayTime() async {
    http.Response res = await http.get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity/10-12-2023?city=jubail&country=saudia+Arab+&method=4"));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      pray = Pray.fromJson(json);
      print("${pray.data.timings.fajr}");
      print("${pray.data.date.gregorian.date}");
    }
  }

  @override
  void initState() {
    super.initState();
    getPrayTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: height * 0.30,
              //color: Colors.blue[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الجبيل",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${pray.data.date.hijri.day}  ${pray.data.date.hijri.month.ar} ",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              )),
          Container(
            height: height * 0.65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90))),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${pray.data.timings.fajr}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        "الفجر",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.blue[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${pray.data.timings.dhuhr}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        "الظهر",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.blue[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${pray.data.timings.asr}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        "العصر",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.blue[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${pray.data.timings.maghrib}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        "المغرب",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.blue[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${pray.data.timings.isha}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        "العشا",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
