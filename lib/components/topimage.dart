import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  final String topimage;
  final double height;
  const TopImage({super.key, required this.topimage, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        topimage,
        height: height,
      ),
    );
  }
}