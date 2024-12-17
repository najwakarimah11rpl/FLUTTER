import 'package:flutter/material.dart';

void main(){
  runApp(Hitam());
}

class Hitam extends StatelessWidget {
  const Hitam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Malam"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
           // color: Colors.black,
           
            child: Image.network("lib/file/unduhan.jpeg"),

          ),
          ),
        ),
      );
  }
}