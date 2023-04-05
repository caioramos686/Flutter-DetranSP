import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomAlertSucess extends StatefulWidget {
  final String text;

  const CustomAlertSucess({Key? key, required this.text}) : super(key: key);

  @override
  _CustomAlertSucessState createState() => _CustomAlertSucessState();
}

class _CustomAlertSucessState extends State<CustomAlertSucess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Cores.verde,
          border: Border.all(
            width: MediaQuery.of(context).devicePixelRatio * 1.5,
            color: Cores.verdeClaro,
          )),
      width: double.infinity,
      height: MediaQuery.of(context).devicePixelRatio * 110,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

  }
}
