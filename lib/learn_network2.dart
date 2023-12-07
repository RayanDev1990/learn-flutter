import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class LearnNetwork2 extends StatefulWidget {
  const LearnNetwork2({super.key});

  @override
  State<LearnNetwork2> createState() => _LearnNetwork2State();
}

class _LearnNetwork2State extends State<LearnNetwork2> {
  var list = [];

  Future getData() async {
    var res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var jsonResponse = jsonDecode(res.body);

    if (res.statusCode == 200) {
      list.addAll(jsonResponse);
      print(list.length);
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
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 20,
          color: Colors.blue[200],
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.blue[600],
            title: Text(
              "${list[index]["title"]}",
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          );
        },
      ),
    );
  }
}
