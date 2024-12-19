import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

void main() {
  runApp(MyDate());
}

class MyDate extends StatelessWidget {
  const MyDate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date"),
        ),
        body: Center(
          child: Text(
            DateFormat('yMMMMd').add_Hms().format(DateTime.now()), // Use a valid format
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
