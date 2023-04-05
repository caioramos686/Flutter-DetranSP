import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomButtonHalf extends StatelessWidget {
  final String name;
  final Function onClick;
  final Color? colors;
  double tamanhoBorda;

  CustomButtonHalf({
    Key? key,
    required this.name,
    required this.onClick,
    this.colors,
    this.tamanhoBorda = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 330, //MediaQuery.of(context).devicePixelRatio * 330,
        height: 60, //MediaQuery.of(context).devicePixelRatio * 60,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(tamanhoBorda)),
            color: colors != null ? Colors.transparent : Cores.azul,
            border: Border.all(
              width: 1,
              color: colors != null ? colors! : Cores.azul,
            )),
        child: Center(
            child: Text(
              name,
              style: TextStyle(color: colors != null ? colors! : Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            )),
      ),
    );
  }
}
