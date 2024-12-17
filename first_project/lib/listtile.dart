import 'package:flutter/material.dart';

void main() {
  runApp(Ya());
}

class Ya extends StatelessWidget {
  const Ya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wangsaf"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical:10,horizontal: 8),
              title: Text("Grup meme"),
              subtitle: Text("Halo aku gue",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(),
              trailing: Text("10.00"),
              tileColor: Colors.black,
              textColor: Colors.white,
              dense: true,
              onTap: () {
                return;
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("Azril"),
              subtitle: Text("aduh gantengnya"),
              leading: CircleAvatar(),
              trailing: Text("12.00"), 
            ),
            Divider(),
            ListTile(
              title: Text("Sirkel Jawara"),
              subtitle: Text("P ngops"), 
              leading: CircleAvatar(),
              trailing: Text("18.00"),
            ),
            Divider(),
            ListTile(
              title: Text("Grup ngonser"),
              subtitle: Text("Info tiket"),
              leading: CircleAvatar(),
              trailing: Text("21.00"),
            ),
          ],
        ),
      ),
    );
  }
}
