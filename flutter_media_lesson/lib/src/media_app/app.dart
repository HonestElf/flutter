import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyMediaApp extends StatelessWidget {
  const MyMediaApp({super.key});

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
  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(fileContents);
  }

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      closedCaptionFile: _loadCaptions(),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 200,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            ClosedCaption(
              text: _controller.value.caption.text,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: _controller.value.isPlaying
                      ? IconButton(
                          onPressed: () {
                            _controller.pause();
                          },
                          icon: const Icon(Icons.pause))
                      : IconButton(
                          onPressed: () {
                            _controller.play();
                          },
                          icon: const Icon(Icons.play_arrow)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
