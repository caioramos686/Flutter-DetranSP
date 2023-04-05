import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomButtonFull extends StatelessWidget {
  final String name;
  final Function onClick;
  final Color? colors;
  bool? changeColor;
  double tamanhoBorda;

  CustomButtonFull({
    Key? key,
    required this.name,
    required this.onClick,
    this.colors,
    this.changeColor,
    this.tamanhoBorda = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).devicePixelRatio * 60,
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
              style: TextStyle(color: colors != null ? colors! : Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
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
