import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.link});
  final String? link;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoaded = false;
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log("prosses$progress %");
            if (progress == 100) {
              log("loaded");
              setState(
                () {},
              );
              isLoaded = true;
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.link!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Web Page",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      body: isLoaded
          ? WebViewWidget(
              controller: controller,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
