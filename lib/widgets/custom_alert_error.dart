import 'package:flutter/material.dart';

import 'custom_colors.dart';



class CustomAlertError extends StatefulWidget {
  final String text;

  const CustomAlertError({Key? key, required this.text}) : super(key: key);

  @override
  _CustomAlertErrorState createState() => _CustomAlertErrorState();
}

class _CustomAlertErrorState extends State<CustomAlertError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Cores.vermelho,
          border: Border.all(
            width: MediaQuery.of(context).devicePixelRatio * 1.5,
            color: Cores.vermelho,
          )),
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 38, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold),
      ),
    );
  }
}
