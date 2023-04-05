import 'package:flutter/material.dart';

class CustomTextBold extends StatelessWidget {
  final String text;

  const CustomTextBold({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
