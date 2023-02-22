import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  final List<XFile> photos;
  const GalleryWidget({super.key, required this.photos});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: widget.photos.isEmpty
            ? const Center(
                child: Text('No photo yet'),
              )
            : GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  ...widget.photos.map((photo) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(photo.path),
                          fit: BoxFit.cover,
                        ),
                      ))
                ],
              ));
  }
}
