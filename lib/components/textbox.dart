import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  TextBox({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
         decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 199, 199, 199),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 46, 44, 44)),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20.0, color: Color(0xFFB9B9B9)),
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        ),
      ),
    );
  }
}
