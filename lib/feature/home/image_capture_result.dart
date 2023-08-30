import 'dart:io';

import 'package:flutter/material.dart';

class ImageCaptureResultWidget extends StatelessWidget {
  const ImageCaptureResultWidget({
    super.key,
    required this.file,
    this.margin = EdgeInsets.zero,
    this.width = 300,
  });

  final File file;
  final EdgeInsets margin;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Image.file(
        file,
        width: width,
      ),
    );
  }
}
