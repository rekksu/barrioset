// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30),
        ),
      );
  }
}