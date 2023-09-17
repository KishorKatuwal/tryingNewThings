import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TryingMapScreen extends StatefulWidget {
  static const String routeName = "/trying-map";

  const TryingMapScreen({Key? key}) : super(key: key);

  @override
  State<TryingMapScreen> createState() => _TryingMapScreenState();
}

class _TryingMapScreenState extends State<TryingMapScreen> {
  late final WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: _controller,


      ),
    );
  }
}
