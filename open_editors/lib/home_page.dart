import 'package:flutter/material.dart';
import 'package:open_editors/webview_page.dart'; // Ensure the path is correct

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),  // Optional AppBar with a title
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Web"), // Use const for better performance
          onPressed: () {
            // Push WebviewPage onto the navigation stack
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WebviewPage()),
            );
          },
        ),
      ),
    );
  }
}
