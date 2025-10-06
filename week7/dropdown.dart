import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //initial selected value
  String dropDownValue = "USA";
  //list of items for dropdown menu
  var countries = [
    'USA', 'China', 'Armenia', 'France', 'Italy', 'Portugal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              //inital value
              value: dropDownValue,
                //drop arrow icon
                icon: Icon(Icons.keyboard_arrow_down),
                //use map to transform list of objects
                //to drop down menu object
                items: countries.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
            })
          ],
        ),
      ),
    );
  }
}

