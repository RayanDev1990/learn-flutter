import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [
    {"fname": "rayan", "lname": "alghamdi"}
  ];
  TextEditingController in1 = TextEditingController();
  TextEditingController in2 = TextEditingController();

  addPerson() {
    data.add({"fname": in1.text, "lname": in2.text});
    in1.clear();
    in2.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: in1,
            decoration: InputDecoration(
                fillColor: Colors.red, filled: true, label: Text("First Name")),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: in2,
            decoration: InputDecoration(
                fillColor: Colors.red, filled: true, label: Text("Last Name")),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addPerson();
                },
                child: Text("Add"),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      Text(
                        "first Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Action",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  for (var d in data)
                    TableRow(children: [
                      Text("${d["fname"]}"),
                      Text("${d["lname"]}"),
                      Text("${d["fname"]}"),
                    ]),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
