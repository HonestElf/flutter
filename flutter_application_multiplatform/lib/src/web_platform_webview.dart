import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_multiplatform/src/platform_view_registry.dart';
import 'dart:html';

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  final String link;
  const WebPlatformWebView({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    platformViewRegistry.registerViewFactory(
        id, (int viewId) => IFrameElement()..src = link);

    return Container(child: HtmlElementView(viewType: id));
  }
}
