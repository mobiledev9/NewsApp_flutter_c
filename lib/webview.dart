import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class webView extends StatefulWidget {
  String news;
  webView(this.news);
  // const webView({super.key});

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.news,
        ));
  }
}
