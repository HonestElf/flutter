import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewApp extends StatelessWidget {
  const MyWebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late WebViewController _controller;
  // final CookieManager _cookieManager = CookieManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: InAppWebView(
      //   onWebViewCreated: (controller) {
      //     _webViewController = controller;
      //   },
      //   initialOptions: options,
      //   initialUrlRequest: URLRequest(
      //     url: Uri.parse("https://inappwebview.dev"),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       // _loadUrl();
      //       _loadLocalUrl();
      //       // _openRealBrowser();
      //     },
      //     child: const Icon(Icons.add)),
    );
  }
}
