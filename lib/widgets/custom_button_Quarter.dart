import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomButtonQuarter extends StatelessWidget {
  final String name;
  final Function onClick;
  final Color? colors;

  const CustomButtonQuarter({
    Key? key,
    required this.name,
    required this.onClick,
    this.colors,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: MediaQuery.of(context).devicePixelRatio * 130,
        height: MediaQuery.of(context).devicePixelRatio * 60,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            color: colors != null ? Colors.transparent : Cores.azul,
            border: Border.all(
              width: 1,
              color: colors != null ? colors! : Cores.azul,
            )),
        child: Center(
            child: Text(
              name,
              style: TextStyle(color: colors != null ? colors! : Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            )),
      ),
    );
  }
}
