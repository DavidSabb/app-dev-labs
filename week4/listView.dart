import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFabBtn(),
      title: 'Flutter Demo',
    );
  }
}


class MyFabBtn extends StatefulWidget {
  const MyFabBtn({super.key});

  @override
  State<MyFabBtn> createState() => _MyFavBtnState();
}

class _MyFavBtnState extends State<MyFabBtn> {
  String _value = "";
  void _onClicked() => setState(() => _value = new DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LV example'),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.lime[600],
            child: Center(child: Text('apple'),),
          ),
          Container(
            height: 50,
            color: Colors.red[600],
            child: Center(child: Text('watermelon'),),
          ),
          Container(
            height: 50,
            color: Colors.purple[600],
            child: Center(child: Text('grape'),),
          ),
          Container(
            height: 50,
            color: Colors.blue[600],
            child: Center(child: Text('blueberry'),),
          ),
        ],
      ),
    );
  }
}
