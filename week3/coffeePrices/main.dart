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
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp>{
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Prices"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'asset/americano.jpg',
                          width: 300,
                          height: 240,
                        ),
                        Text('Americano'),
                        Text("Price: 10\$"),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            total += 10;
                          });
                        },
                            child: Text("+"))
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'asset/latte.jpg',
                          width: 300,
                          height: 240,
                        ),
                        Text('Latte'),
                        Text('Price: 8\$'),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            total += 8;
                          });
                        },
                            child: Text("+"))
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Total: ${total.toString()}\$")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
