import 'package:flutter/material.dart';
import 'custom_colors.dart';


class customPopUp extends StatefulWidget {
  final String text;
  final String navigator;
  final Object? arguments;
  bool? corVermelha;

  customPopUp({Key? key, required this.text, required this.navigator, this.arguments, this.corVermelha = false}) : super(key: key);

  @override
  _customPopUpState createState() => _customPopUpState();
}

class _customPopUpState extends State<customPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 24),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(14),
            width: MediaQuery.of(context).devicePixelRatio * 110,
            height: MediaQuery.of(context).devicePixelRatio * 60,
            decoration: BoxDecoration(
                border: Border.all(
                  width: MediaQuery.of(context).devicePixelRatio * 1,
                  color: widget.corVermelha == false ? Cores.azul : Cores.vermelho,
                )),
            child: Center(
              child: Text(
                "Voltar",
                style: TextStyle(
                  fontSize: 20,
                  color: Cores.azul,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.all(14),
            width: MediaQuery.of(context).devicePixelRatio * 110,
            height: MediaQuery.of(context).devicePixelRatio * 60,
            color: Cores.azul,
            child: const Center(
              child: Text(
                "Continuar",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, widget.navigator, arguments: widget.arguments);
          },
        )
      ],
    );
  }
}