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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
          title: Text(
            "WebView",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.news,
        ));
  }
}
