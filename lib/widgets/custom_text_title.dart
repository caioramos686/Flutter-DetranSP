import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String textTitle;

  const CustomTextTitle({Key? key, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${textTitle}",
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
