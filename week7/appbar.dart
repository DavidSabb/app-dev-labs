import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: MyPage(),);
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.android),text: 'Google',),
                Tab(icon: Icon(Icons.phone_iphone),text: 'Apple',),
              ],
            ),
            title: Text("Tab bar demo"),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Android Pixel"),),
              Center(child: Text("Iphone Device"),),
            ],
          ),
        ));
  }
}

