import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TestingApp());
  }
}

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lake View"),
      ),
      body: ListView(
        children: [
          Image.asset(
            'asset/mountain.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  //gives exact space from the widget called
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text('Oeschinen Lake Campground',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        'Kandesteg, Switzerland',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text('41'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'CALL',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'SEND',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'SHARE',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(32),
            child: Text(
              'testing', softWrap: true, textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
