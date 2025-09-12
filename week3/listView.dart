import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ImageContainer()
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _tile('Cinearts at the empire', '85 W portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '5193 Twin St', Icons.theaters),
        _tile('AMC Meator 25', '134 5th St', Icons.theaters),
        _tile('K\'s Kitchen', '12 Montery Blvd', Icons.restaurant),
        _tile('La Ciccia', '214 Claremont St', Icons.restaurant),
        _tile('Cinearts at the empire', '85 W portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '5193 Twin St', Icons.theaters),
        _tile('AMC Meator 25', '134 5th St', Icons.theaters),
        _tile('K\'s Kitchen', '12 Montery Blvd', Icons.restaurant),
        _tile('La Ciccia', '214 Claremont St', Icons.restaurant),
        _tile('Cinearts at the empire', '85 W portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '5193 Twin St', Icons.theaters),
        _tile('AMC Meator 25', '134 5th St', Icons.theaters),
        _tile('K\'s Kitchen', '12 Montery Blvd', Icons.restaurant),
        _tile('La Ciccia', '214 Claremont St', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),),
      subtitle: Text(subtitle),
      leading: Icon(
        icon, color: Colors.blue[500],
      ),
    );
  }
}