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
        title: Text("FAB"),
        backgroundColor: Colors.blueAccent,centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        //if you set mini to true then it will make your FAB small
        mini: false,
        child: Icon(Icons.timer),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(_value),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: null, child: Text("login")),
              DataTable(
                  columns: [
                    DataColumn(label: Text("roll num")),
                    DataColumn(label: Text("Student name")),
                    DataColumn(label: Text("Mobile Number")),
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(Text("122")),
                          DataCell(Text("david")),
                          DataCell(Text("5128133")),
                        ])
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
