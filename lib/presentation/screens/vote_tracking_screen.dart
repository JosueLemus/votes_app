import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VoteTrackingScreen extends StatefulWidget {
  final String idAddress;

  const VoteTrackingScreen({Key? key, required this.idAddress})
      : super(key: key);

  @override
  _VoteTrackingScreenState createState() => _VoteTrackingScreenState();
}

class _VoteTrackingScreenState extends State<VoteTrackingScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    const String url = 'https://www.google.com';

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de voto'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
