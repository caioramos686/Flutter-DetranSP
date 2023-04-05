import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomHomeButton extends StatelessWidget {
  final String name;
  final IconData Icons;
  final Function onClick;

  const CustomHomeButton({
    Key? key,
    required this.name,
    required this.Icons,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Column(
          children: [
            Container(
              width: 250, //MediaQuery.of(context).devicePixelRatio * 250,
              height: 150, //MediaQuery.of(context).devicePixelRatio * 150,
              decoration: BoxDecoration(
                  color: Cores.azul,
                  borderRadius: const BorderRadius.all(Radius.circular(15))
              ),
              child: Center(child: Icon(Icons, size: MediaQuery.of(context).devicePixelRatio * 80, color: Colors.white,)),
            ),
            Text(name, style: const TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
