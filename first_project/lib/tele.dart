import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Telegram"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            ChatItem(
              imageUrl: "https://picsum.photos/seed/picsum/200/300",
              title: "Grub Roblok",
              subtitle: "login",
            ),
            ChatItem(
              imageUrl: "https://picsum.photos/id/237/200/300",
              title: "Sirkel Rojer",
              subtitle: "posisi",
            ),
            ChatItem(
              imageUrl: "https://picsum.photos/200",
              title: "Cosplay",
              subtitle: "siapa yg ngevent rek",
            ),
            ChatItem(
              imageUrl: "https://picsum.photos/200/300",
              title: "Meme malas",
              subtitle: "aduh le",
            ),
            ChatItem(
              imageUrl: "",
              title: "Asep",
              subtitle: "aur auran",
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  ChatItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: imageUrl.isNotEmpty
            ? NetworkImage(imageUrl)
            : AssetImage('assets/placeholder.jpg') as ImageProvider,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text("22.00"),
    );
  }
}
