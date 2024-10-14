import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: NinjaCard(),
  ));
}

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0.0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/OIP(1).jpeg'),
                radius: 40.0,
              ),
            ),
            const Divider(
              height: 90.0,
              color: Colors.grey,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 20.0,
              ),
            ),
            const Text(
              'Anomali',
              style: TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 20.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              '$ninjaLevel',
              style: const TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'anomali@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
