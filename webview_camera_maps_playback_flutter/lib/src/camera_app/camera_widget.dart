import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('camera'),
      ),
    );
  }
}
