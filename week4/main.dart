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
                  Text('Minnesota Timberwolves'),
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
  int team1 = 0;
  int team2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball Points counter"),
        backgroundColor: Colors.orange,
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
                        Text('Cleveland Cavaliers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('${team1.toString()}', style: TextStyle(fontSize: 100),),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team1 += 1;
                          });
                        },
                            child: Text("add 1 point")),
                        SizedBox(height: 15,),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team1 += 2;
                          });
                        },
                            child: Text("add 2 point")),
                        SizedBox(height: 15,),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team1 += 3;
                          });
                        },
                            child: Text("add 3 point")),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Minnesota Timberwolves', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('${team2.toString()}', style: TextStyle(fontSize: 100),),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team2 += 1;
                          });
                        },
                            child: Text("add 1 point")),
                        SizedBox(height: 15,),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team2 += 2;
                          });
                        },
                            child: Text("add 2 point")),
                        SizedBox(height: 15,),
                        ElevatedButton(onPressed:
                            () {
                          setState(() {
                            team2 += 3;
                          });
                        },
                            child: Text("add 3 point"))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    ElevatedButton(onPressed:
                        () {
                      setState(() {
                        team1 = 0;
                        team2 = 0;
                      });
                    },
                        child: Text("Reset"))
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
