import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets edgeInsets;
  const Dots({super.key, this.onTap, required this.color, required this.borderRadius, required this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: edgeInsets,
        decoration: BoxDecoration(
        color: color,       
        borderRadius: borderRadius,
        ),
      ),
    );
  }
}