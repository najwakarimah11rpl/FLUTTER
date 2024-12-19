import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Yea());
}

class Yea extends StatelessWidget {
  final Random random = Random();

  Yea({Key? key}) : super(key: key);

  List<Container> generateContainers() {
    return List.generate(
      90,
      (index) {
        return Container(
          height: 50,
          width: 150,
          color: Color.fromARGB(
            255,
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View apalah"),
        ),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          children: generateContainers(),
        ),
      ),
    );
  }
}
