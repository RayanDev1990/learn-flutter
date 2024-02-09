import 'package:flutter/material.dart';
import 'package:project/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final field = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter Your Name"),
            TextField(controller: field),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  name = field.text.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SecondScreen(name: name))));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
