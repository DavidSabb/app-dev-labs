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

  List<Widget> _widgetOptions = [
    Text('Home Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    Text('Search Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    Text('Profile Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      //it should be outside the body because it remains static for all the index
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.red,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 4,
      ),
    );
  }
}
