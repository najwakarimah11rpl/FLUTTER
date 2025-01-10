import 'package:flutter/material.dart';

void main() {
  runApp(Bar());
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.amber,
          ),
          leadingWidth: 100,
          title: Container(
            width: 35,
            height: 35,
            color: Colors.red,
          ),
          titleSpacing: 0,
          centerTitle: false,
          actions: [
            Container(
              width: 50,
              height: 100,
              color: Colors.purple,
            ),
            Container(
              width: 50,
              // height: 100,
              color: Colors.black,
            ),
            Container(
              width: 50,
              // height: 100,
              color: Colors.pink,
            ),
            Container(
              width: 50,
              // height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              // height: 100,
              color: Colors.green,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              width: 50,
              height: 200,
              color: Colors.purple,
            ),
          ),
          flexibleSpace: Column( // Combine the flexibleSpace widgets here
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.green,
              ),
              Text(
                "Flexible space",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
