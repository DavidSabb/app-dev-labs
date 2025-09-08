import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CoffeeApp());
  }
}

class CoffeeApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffe Prices"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              children: [
                Column(children: [
                  Image.asset(
                    'asset/mountain.jpg',
                    width: 300,
                    height: 240,
                  ),
                  Text('20'),
                  Text('Coffe Brew'),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
