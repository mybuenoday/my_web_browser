import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY WEB BROWSER'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'https://www.linkedin.com/in/yoonjikimkr/',
                child: Text('LinkedIn'),
              ),
              const PopupMenuItem<String>(
                value: 'https://westpl4.tistory.com/',
                child: Text('Blog'),
              ),
              const PopupMenuItem<String>(
                value: 'https://github.com/mybuenoday',
                child: Text('Github'),
              ),
            ],
          ),
        ],
      ),
      body: const WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
