// Dart imports:
import 'dart:html';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_application_multiplatform/src/multiplatform_app/platform_view_registry.dart';

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
