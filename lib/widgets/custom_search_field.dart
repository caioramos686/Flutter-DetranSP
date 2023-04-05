import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_fonts.dart';
import 'custom_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String name;
  final TextEditingController controller;
  final Function onClick;
  final List<TextInputFormatter>? inputKeyboardType;
  void Function(String)? onChanged;
  IconData icon;

  CustomSearchField({
    Key? key,
    this.keyboardType,
    this.inputKeyboardType,
    required this.name,
    required this.controller,
    required this.onClick,
    this.onChanged,
    this.icon = Icons.search

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 25),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF355CEB)),
        ),
        hintText: name,
        hintStyle: Fontes.tamanhoPadrao,
        suffixIcon: InkWell(
          onTap: () {
            onClick();
          },
          child: Icon(
            icon,
            size: 40,
            color: Cores.azul,
          ),
        ),
      ),
      inputFormatters: inputKeyboardType,
      onEditingComplete: () {
        onClick();
      },
      onChanged: onChanged,
      controller: controller,
    );
  }
}
