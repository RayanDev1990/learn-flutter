import 'package:flutter/material.dart';

import 'data.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List filter = countries;
  search(value) {
    List result = [];
    if (value.toString().isEmpty) {
      filter = countries;
    } else {
      result = countries
          .where((element) =>
              element.toLowerCase().contains(value.toString().toLowerCase()))
          .toList();

      setState(() {
        filter = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                  filled: true, fillColor: Colors.blue, hintText: "Search"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: filter.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text("${filter[index]}"),
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}
