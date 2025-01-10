import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CombinedScreen(),
    );
  }
}

class CombinedScreen extends StatelessWidget {
  const CombinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flexible, Box & FittedBox",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flexible & Expanded Layout:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "Text 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 100,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "Text 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "Text 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "FittedBox Layout with Image:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 200,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  child: Image.network("https://picsum.photos/400/200"),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthapp = MediaQuery.of(context).size.width;
    final heiapp = MediaQuery.of(context).size.height;
    final paddingtop = MediaQuery.of(context).padding.top;

    final myappb = AppBar(title: Text("Layout builder"));
    final heibody = heiapp - paddingtop - myappb.preferredSize.height;

    return Scaffold(
      appBar: myappb,
      body: Container(
        width: widthapp,
        height: heibody * 0.5,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyCon(widthapp),
            MyCon(widthapp),
            MyCon(widthapp),
          ],
        ),
      ),
    );
  }
}

class MyCon extends StatelessWidget {
  final double widthapp;
  const MyCon(this.widthapp, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: widthapp * 0.25,
          height: constraints.maxHeight * 0.5,
          color: Colors.amber,
        );
      },
    );
  }
}
