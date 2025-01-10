import 'dart:math';  
import 'package:flutter/material.dart';

void main() {
  runApp(Dizz());
}

class Dizz extends StatelessWidget {
  const Dizz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mydiz(),
    );
  }
}

class Mydiz extends StatelessWidget {
  final Random random = Random();  

  final List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
  final List<String> sentences = [
    'This is a random sentence.',
    'Flutter is amazing!',
    'Dart is a great programming language.',
    'Keep learning new things.',
    'Let\'s build some awesome apps!'
  ];

  String getRandomName() {
    return names[random.nextInt(names.length)];
  }

  String getRandomSentence() {
    return sentences[random.nextInt(sentences.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
        backgroundColor: Colors.purple, 
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Geser untuk Hapus",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  direction: DismissDirection.endToStart, 
                  onDismissed: (direction) {
                    print("DISMISS");
                    if (direction == DismissDirection.endToStart) {
                      print("End to start");
                    } else {
                      print("Start to end");
                    }
                  },
                  confirmDismiss: (direction) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirm"),
                          content: Text("Are you sure you want to delete?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);  
                              },
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);  
                              },
                              child: Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  background: Container(
                    color: Colors.red, 
                    child: Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: Text("${index + 1}"),
                      ),
                    ),
                    title: Text(getRandomName()),  
                    subtitle: Text(getRandomSentence()),  
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
