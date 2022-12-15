// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:flutter_application_multiplatform/src/multiplatform_app/app_platform.dart';

Widget webView(String link) => AppPlatform.isMobile
    ? WebView(
        initialUrl: link,
      )
    : HyperLink(link: link);

class HyperLink extends StatelessWidget {
  final String link;
  const HyperLink({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(link));
      },
      child: Center(
        child: Text(
          link,
          style: const TextStyle(
              decoration: TextDecoration.underline, color: Colors.blue),
        ),
      ),
    );
  }
}
