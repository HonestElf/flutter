import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    super.key,
  });

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? camController;
  XFile? lastImage;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    camController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = camController;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _onNewCameraSelected(cameraController.description);
    }
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    if (camController != null) {
      await camController!.dispose();
    }

    final CameraController cameraController = CameraController(
        cameraDescription,
        kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg);

    camController = cameraController;
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();

    camController = CameraController(cameras[0], ResolutionPreset.max);
    await camController!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a photo'),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            camController?.value.isInitialized == true
                ? Center(
                    child: CameraPreview(camController!),
                  )
                : const SizedBox(),
            if (lastImage != null)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    width: 120,
                    height: 240,
                    child: Image.file(
                      File(lastImage!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                iconSize: 48,
                onPressed: () async {
                  lastImage = await camController?.takePicture();

                  setState(() {});
                },
                icon: const Icon(Icons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
