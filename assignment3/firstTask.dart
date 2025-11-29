import 'package:flutter/material.dart';

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

  void _calcBMI(){
    double mHeight = height / 100;
    double fHeight = mHeight * mHeight;
    setState(() {
      BMI = weight / fHeight;
    });
  }

  bool isMale = true;
  double height = 180;
  int weight = 60;
  int age = 18;
  double BMI = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('B.M.I Calculator'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: ListView(
          children: [
            // Gender selection row
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 130,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isMale ? Colors.purple : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, color: Colors.white, size: 60),
                          const SizedBox(height: 8),
                          const Text(
                            'MALE',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 130,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: !isMale ? Colors.purple : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, color: Colors.white, size: 60),
                          const SizedBox(height: 8),
                          const Text(
                            'FEMALE',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Height selection row
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${height.toInt()} cm',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Slider(
                    activeColor: Colors.pinkAccent,
                    inactiveColor: Colors.white54,
                    value: height,
                    min: 80,
                    max: 220,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Weight and Age selection row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$weight',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.black54,
                              heroTag: 'weight-',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                              backgroundColor: Colors.black54,
                              heroTag: 'weight+',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$age',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.black54,
                              heroTag: 'age-',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                              backgroundColor: Colors.black54,
                              heroTag: 'age+',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  _calcBMI();
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            if (BMI > 0) // Only show if BMI is calculated
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Your BMI is: ${BMI.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
    );
  }
}