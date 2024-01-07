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
      body: WillPopScope(
        onWillPop: () async {
          if (await _webViewController.canGoBack()) {
            await _webViewController.goBack(); // WebView 내에서 뒤로 가기.
            return false; // 시스템 레벨의 뒤로 가기[앱 종료]를 하지 않도록.
          }
          return true; // 시스템 레벨에서 뒤로 가기[앱 종료]
        },
        child: WebView(
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _webViewController = controller; // 초기화
          },
        ),
      ),
    );
  }
}
