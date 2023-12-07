import 'package:flutter/material.dart';
import 'package:project/home_page.dart';
import 'package:project/learn_network2.dart';

import 'filter_list.dart';
import 'learn_network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FilterList(),
    );
  }
}
