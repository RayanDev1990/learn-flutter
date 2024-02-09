import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({required this.name, super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("Welcome ${widget.name}")],
      ),
    );
  }
}
