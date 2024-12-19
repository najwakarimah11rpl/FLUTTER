import 'package:flutter/material.dart';

void main() {
  runApp(Anu());
}

class Anu extends StatelessWidget {
  final List<Map<String, dynamic>> mylist = [
    {
      "Name": "Asep",
      "Age": 22,
      "fcolor": [
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
      ],
    },
    {
      "Name": "Agus",
      "Age": 20,
      "fcolor": ["red", "blue", "green"],
    },
    {
      "Name": "Asep",
      "Age": 22,
      "fcolor": [
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
      ],
    },
    {
      "Name": "Asep",
      "Age": 22,
      "fcolor": [
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
      ],
    },
    {
      "Name": "Asep",
      "Age": 22,
      "fcolor": [
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
        "pink", "white", "black",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("ID App"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: mylist.map((data) {
            List myfavcolor = data["fcolor"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${data["Name"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Age: ${data["Age"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: myfavcolor.map((color) {
                          return Container(
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              color,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
