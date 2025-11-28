import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Notifications Example',
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  State<BMICalculator> createState() => BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  @override
  void initState() {
    super.initState();
  }

  bool isMale = true;
  double height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF9D50DD),
      ),
      body: Center(
        child: Column(
          children: [
            //select gender row
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  )
                ))
              ],
            ),
            //select height row
            Row(
              children: [

              ],
            ),
            //select weight and age row
            Row(
              children: [

              ],
            ),
            //calculate btn row
            Row(
              children: [

              ],
            )
          ],
        )
      ),
    );
  }
}