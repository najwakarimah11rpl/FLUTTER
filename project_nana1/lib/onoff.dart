import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: status ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text("Background"),
        backgroundColor: status ? Colors.black : Colors.white,
        foregroundColor: status ? Colors.white : Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.red,
              value: status,
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              },
            ),
            Text(
              (status) ? "Terang" : "Gelap",
              style: TextStyle(
                fontSize: 35,
                color: status ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
