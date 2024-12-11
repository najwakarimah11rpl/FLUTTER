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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Halo rek"),
        ),
        body: Center(
          child: Text(
            "aduh rek",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amber,
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontFamily: 'Stick',
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
              decorationColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
