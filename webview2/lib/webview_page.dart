import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    // Initialize WebView
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () async {
              if (await webViewController.canGoForward()) {
                await webViewController.goForward();
              }
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WebView(
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        javascriptMode: JavaScriptMode.unrestricted,
        initialUrl: 'https://flutter.dev',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? title = await webViewController.getTitle();
          print(title);
        },
        child: const Icon(Icons.title),
      ),
    );
  }
}
