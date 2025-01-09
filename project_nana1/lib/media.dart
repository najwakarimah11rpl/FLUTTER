import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Media(),  // This is where your `Media` widget will be displayed
    );
  }
}

class Media extends StatelessWidget {
  const Media({super.key});

  @override
  Widget build(BuildContext context) {
    final mediahe = MediaQuery.of(context).size.height;
    final mediawi = MediaQuery.of(context).size.width;
    
    final myapbar = AppBar(
      title: Text("Gak tau"),
    );

    final bodyhe = mediahe - myapbar.preferredSize.height - MediaQuery.of(context).padding.top;

    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: myapbar,
      body: Center(
        child: isLandscape
            ? Column(
                children: [
                  Container(
                    height: bodyhe * 0.3,
                    width: mediawi,
                    color: Colors.green,
                  ),
                  Container(
                    height: bodyhe * 0.7,
                    color: Colors.amber,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text("halo rek"),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    height: bodyhe * 0.3,
                    width: mediawi,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyhe * 0.7,
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text("hai orang2 beriman"),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
