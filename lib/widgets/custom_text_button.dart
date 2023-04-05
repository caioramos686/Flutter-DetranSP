import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String name;
  final Function onClick;

  const CustomTextButton({
    Key? key,
    required this.name,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Cores.azul),
        ),
      ),
    );
  }
}
