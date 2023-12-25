import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
    final String image;
  final double height;
  const Logo ({super.key, required this.image, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        height: height,
      ),
    );
  }
}