import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(
      text: "Photo",
      icon: Icon(Icons.add_a_photo),
    ),
    Tab(
      icon: Icon(Icons.ac_unit_outlined),
      text: "Cuaca",
    ),
    Tab(
      icon: Icon(Icons.accessibility_rounded),
      text: "Kontak",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 2,
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Tabbar",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicator: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
              ),
              tabs: myTabs,
            ),
          ),
          body: Container(
            color: Colors.black,
            child: TabBarView(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Text(
                      "Foto berfungsi untuk merekam kenangan, memperkuat emosi, dan menjaga momen penting dalam hidup",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Text(
                      "Cuaca hari ini cerah berawan dengan suhu 24°C hingga 32°C. Beberapa daerah mungkin mengalami hujan ringan sore hari. Angin bertiup dari timur dengan kecepatan sedang.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Text(
                      "Kontak:\n\nNama: John Doe\nTelepon: +62 812 3456 7890\nEmail: johndoe@email.com\n\nJika Anda ingin menghubungi saya, bisa melalui telepon atau email. Terima kasih!",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
