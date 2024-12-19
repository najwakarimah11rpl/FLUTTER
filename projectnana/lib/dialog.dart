import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Dia(),
  ));
}

class Dia extends StatefulWidget {
  @override
  State<Dia> createState() => _DiaState();
}

class _DiaState extends State<Dia> {
  String data = "Belum ada input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog "),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 35),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Telah diklik");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm"),
                content: Text("Are you sure to delete?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      print("Klik no");
                      setState(() {
                        data = "Hai";
                      });
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      print("Klik yes");
                      setState(() {
                        data = "Dihapus";
                      });
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes"),
                  ),
                ],
              );
            },
          ).then((value) {
            print(value);
          });
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
