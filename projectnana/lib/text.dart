import 'package:flutter/material.dart';

void main() {
  runApp(Myte());
}

class Myte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teks Field le"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: false,
                  enableSuggestions: true,
                  enableInteractiveSelection: true,
                  readOnly: false,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: true,
                    icon: Icon(Icons.person, size: 35),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                    hintText: "Please input your name",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                    labelText: "Full name",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 30),
                Ya(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ya extends StatefulWidget {
  @override
  State<Ya> createState() => _YaState();
}

class _YaState extends State<Ya> {
  final TextEditingController mycon = TextEditingController();
  String hasil = "Hasil input";

  @override
  void dispose() {
    mycon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: mycon,
          onChanged: (value) {
            print("Onchange: $value");
          },
          onSubmitted: (value) {
            print("OnSubmitted: $value");
            setState(() {
              hasil = value;
            });
          },
          onEditingComplete: () {
            print("Editing complete");
            print(mycon.text);
          },
          decoration: InputDecoration(
            hintText: "Input something here",
            labelText: "Input",
          ),
        ),
        SizedBox(height: 20),
        Text(
          hasil,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
