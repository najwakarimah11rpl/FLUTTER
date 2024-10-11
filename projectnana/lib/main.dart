import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo Rek'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/image.png'), // Update this path to your image
            flex: 3,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.pink,
              child: Text('2'),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.cyan,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(90.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('helo min'),
            Text('minggir,lu'),
            FlatButton(
              onPressed: () {},
              color: Colors.amber,
              child: Text('klik me'),
            ),
            Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30.0),
              child: Text('inside container'),
            ),
            IconButton(
              onPressed: () {
                print('You clicked me, yaho!');
              },
              icon: Icon(Icons.alternate_email),
              color: Colors.amber,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the FloatingActionButton
          print('FloatingActionButton clicked!');
        },
        child: Text('Klik Me'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
