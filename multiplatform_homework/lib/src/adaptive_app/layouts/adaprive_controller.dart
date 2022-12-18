import 'package:flutter/material.dart';

class AdaptiveController extends StatelessWidget {
  final Widget? narrow;
  final Widget? wide;
  final Widget? ultraWide;
  final Widget? other;

  const AdaptiveController({
    super.key,
    this.narrow,
    this.wide,
    this.ultraWide,
    this.other,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920 && ultraWide != null) {
      return ultraWide!;
    }
    if (width >= 600 && wide != null) {
      return wide!;
    }
    if (narrow != null) {
      return narrow!;
    }

    if (other != null) {
      return other!;
    }
    throw Exception('Can not match layout');
  }
}
