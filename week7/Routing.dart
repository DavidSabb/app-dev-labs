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
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  //create 3 textEditing controller
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "enter your name"
              ),
            ),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "enter your email"
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "enter your phone number"
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen(name: _name.text, email: _email.text, phone: _phone.text)));
                },
                child: Text("Go new Page"))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String name, email, phone;

  SecondScreen({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("name: $name"),
            Text("email: $email"),
            Text("phone number: $phone"),
          ],
        ),
      ),
    );
  }
}
