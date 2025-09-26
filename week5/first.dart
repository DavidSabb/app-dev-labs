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
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp>{
  bool totalBtnClicked = false;
  int sum = 0;
  int orangeAmt = 0;
  int orangePrc = 4;
  int berryAmt = 0;
  int berryPrc = 2;
  int grapesAmt = 0;
  int grapesPrc = 1;
  int carrotAmt = 0;
  double carrotPrc = 1.5;
  double subtotal = 0;
  double tax = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: Colors.red),),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
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
                        _buildStack("asset/orange.jpg"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Orange - XX Traders', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),
                        SizedBox(height: 2,),
                        Text("\$${orangePrc.toString()}/2KG", style: TextStyle(color: Colors.blueGrey),),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                if (orangeAmt > 0) {
                                  orangeAmt--;
                                  calcTotals();
                                }
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("-", style: TextStyle(fontSize: 20),)),
                            SizedBox(width: 6,),
                            Text("${orangeAmt.toString()}"),
                            SizedBox(width: 6,),
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                orangeAmt++;
                                calcTotals();
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("+", style: TextStyle(fontSize: 16),)),
                          ],),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        _buildStack("asset/berry.jpg"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Berry - WXY Traders', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
                        SizedBox(height: 2,),
                        Text("\$${berryPrc.toString()}/2KG", style: TextStyle(color: Colors.blueGrey),),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                if (berryAmt > 0) {
                                  berryAmt--;
                                  calcTotals();
                                }
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("-", style: TextStyle(fontSize: 20),)),
                            SizedBox(width: 6,),
                            Text("${berryAmt.toString()}"),
                            SizedBox(width: 6,),
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                berryAmt++;
                                calcTotals();
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("+", style: TextStyle(fontSize: 16),)),
                        ],),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        _buildStack("asset/grapes.jpg"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Grapes - AGR Traders', style: TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.bold),),
                        SizedBox(height: 2,),
                        Text("\$${grapesPrc.toString()}/2KG", style: TextStyle(color: Colors.blueGrey),),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                if (grapesAmt > 0) {
                                  grapesAmt--;
                                  calcTotals();
                                }
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("-", style: TextStyle(fontSize: 20),)),
                            SizedBox(width: 6,),
                            Text("${grapesAmt.toString()}"),
                            SizedBox(width: 6,),
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                grapesAmt++;
                                calcTotals();
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("+", style: TextStyle(fontSize: 16),)),
                          ],),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        _buildStack("asset/carrot.jpg"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Carrot - GAD Traders', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
                        SizedBox(height: 2,),
                        Text("\$${carrotPrc.toString()}/2KG", style: TextStyle(color: Colors.blueGrey),),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                if (carrotAmt > 0) {
                                  carrotAmt--;
                                  calcTotals();
                                }
                              });
                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("-", style: TextStyle(fontSize: 20),)),
                            SizedBox(width: 6,),
                            Text("${carrotAmt.toString()}"),
                            SizedBox(width: 6,),
                            ElevatedButton(onPressed:
                                () {
                              setState(() {
                                carrotAmt++;
                                calcTotals();
                              });

                            },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(40, 40),
                                  shape: CircleBorder(),
                                ),
                                child: Text("+", style: TextStyle(fontSize: 16),)),
                          ],),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                if (totalBtnClicked) _buildTotal(),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    ElevatedButton(onPressed:
                        () {
                      setState(() {
                          calcTotals();
                          totalBtnClicked = true;
                      });
                    },
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(),
                          backgroundColor: Colors.red,
                        ),
                        child: Text("Secure Checkout", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildStack(String filePath) {
    return Stack(
      alignment: const Alignment(0.4, 0.8),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(filePath),
          radius: 50,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
        )
      ],
    );
  }
  void calcTotals() {
    sum = orangeAmt + berryAmt + grapesAmt + carrotAmt;
    subtotal = (orangeAmt * orangePrc) + (berryPrc * berryAmt) +
        (grapesPrc * grapesAmt) + (carrotPrc * carrotAmt);
    tax = double.parse((subtotal * 0.15).toStringAsFixed(2));
    total = double.parse((tax + subtotal).toStringAsFixed(2));
  }

  Widget _buildTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Subtotal(${sum.toString()} items)", style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Text("Tax", style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Text("Cart Total", style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
          ],
        ),
        SizedBox(width: 40,),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("\$${subtotal.toString()}", style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Text("\$${tax.toString()}", style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Text("\$${total.toString()}", style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    );
  }
}