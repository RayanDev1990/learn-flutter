import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnNetwork extends StatefulWidget {
  const LearnNetwork({super.key});

  @override
  State<LearnNetwork> createState() => _LearnNetworkState();
}

class _LearnNetworkState extends State<LearnNetwork> {
  List data = [];

  Future getData() async {
    var res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var jsonResponse = convert.jsonDecode(res.body);
    if (res.statusCode == 200) {
      print("//////////////");
      print(jsonResponse);
      data.addAll(jsonResponse);

      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Network"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var d in data)
                ListTile(
                  title: Text("${d["title"]}"),
                )
            ],
          ),
        ));
  }
}
