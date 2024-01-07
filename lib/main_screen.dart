import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late WebViewController _webViewController; // 늦은 초기화를 위해.

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
              _webViewController.loadUrl(value);
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
      body: WebView(
        // url 변수가 들어왔으니까 const를 제거
        initialUrl: 'https://flutter.dev',
        onWebViewCreated: (controller) {
          _webViewController = controller; // 초기화
        },
      ),
    );
  }
}
