import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ImageContainer()
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});
  static final background = Color(0xFF191919);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.all(48.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(image: AssetImage("asset/hotel.jpg"),),
            ),
            Card(
              color: background,
              shadowColor: Colors.transparent,
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                        'Chill Apartment',
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.white70),
                      ),
                      trailing: Text("Katowice",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white70),
                      )
                  ),
                  const Divider(),
                  ListTile(
                      title: Row(
                        children: [
                          Text("350 \$", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blue),),
                          Text(" per night", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white70),),
                        ]
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Text("4.0/5", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white70),),
                        ],
                      ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(image: AssetImage("asset/hoteltwo.jpg"),),
            ),
            Card(
              color: background,
              shadowColor: Colors.transparent,
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                        'Luxury Katowice Hotel',
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.white70),
                      ),
                      trailing: Text("Katowice",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white70),
                      )
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}