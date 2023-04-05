import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'custom_fonts.dart';

class CustomGreyButton extends StatelessWidget {
  final String name;
  void Function()? onClick;
  final Color? colors;
  bool? changeColor;

  CustomGreyButton({
    Key? key,
    required this.name,
    required this.onClick,
    this.colors,
    this.changeColor = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: changeColor == false ? null : onClick,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).devicePixelRatio * 60,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            color: changeColor == false ? Colors.grey : Cores.azul,
            border: Border.all(
              width: 1,
              color: changeColor == false ? Colors.grey : Cores.azul,
            )),
        child: Center(
            child: Text(
              name,
              style: Fontes.tamanhoPadraoBranco
            )),
      ),
    );
    /*
      SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(colors == null ? Cores.azul : colors)),
        onPressed: () {
          onClick();
        },
        child: Text(
          name,
          style: TextStyle(fontSize: 25, color: colors == Colors.transparent ? Cores.azul : Colors.white),
        ),
      ),
    );

     */
  }
}
