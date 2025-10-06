import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyNavigation()));
}

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  //by default initialize to 0
  int _selectedIndex = 0;
  String dice1 = "asset/valueOne.png";
  String dice2 = "asset/valueTwo.png";


  List<String> _widgetOptions = [
    "asset/valueOne.png",
    "asset/valueTwo.png",
    "asset/valueThree.png",
    "asset/valueFour.png",
    "asset/valueFive.png",
    "asset/valueSix.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(image: AssetImage(dice1), height: 200, width: 200,),
                  ],
                ),
                Column(
                  children: [
                    Image(image: AssetImage(dice2), height: 200, width: 200,)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Random random = Random();
                      int random1 = random.nextInt(6) + 1;
                      int random2 = random.nextInt(6) + 1;
                      dice1 = _widgetOptions[random1];
                      dice2 = _widgetOptions[random2];
                    },
                    child: Text("roll dice!"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
