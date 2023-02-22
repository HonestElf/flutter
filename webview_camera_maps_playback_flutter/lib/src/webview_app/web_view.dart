import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  late InAppWebViewController _webViewController;
  final InAppLocalhostServer _localhostServer = InAppLocalhostServer();

  final TextEditingController _urlController = TextEditingController();

  bool _isLoading = false;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));

  void _loadUrl() async {
    _webViewController.loadUrl(
        urlRequest: URLRequest(url: Uri.parse(_urlController.text)));

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();

    _localhostServer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                // FutureBuilder(
                // future: _webViewController.canGoBack(), // async work
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return IconButton(
                //           onPressed: snapshot.data!
                //               ? () {
                // _webViewController.goBack();
                //                 }
                //               : null,
                //           icon: const Icon(Icons.arrow_back));
                //     } else {
                //       return SizedBox();
                //     }
                //   },
                // ),
                IconButton(
                    onPressed: () {
                      _webViewController.goBack();
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      _webViewController.goForward();
                    },
                    icon: const Icon(Icons.arrow_forward)),
                IconButton(
                    onPressed: () {
                      if (_isLoading) {
                        _webViewController.stopLoading();
                      } else {
                        _webViewController.reload();
                      }
                    },
                    icon: Icon(_isLoading
                        ? Icons.stop_circle
                        : Icons.replay_outlined)),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: 'http://example.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  onPressed: _loadUrl,
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(children: [
              InAppWebView(
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                initialOptions: options,
                onLoadStart: (controller, url) {
                  setState(() {
                    _isLoading = true;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://inappwebview.dev"),
                ),
              ),
              _isLoading
                  ? Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const CircularProgressIndicator(
                            backgroundColor: Colors.white),
                      ),
                    )
                  : const SizedBox()
            ]),
          ),
        ],
      ),
    );
  }
}
