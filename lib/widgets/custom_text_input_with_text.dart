import 'package:boleto_digital/widgets/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_fonts.dart';

class CustomTextInputWithText extends StatefulWidget {
  final bool? obscureText;
  final String textoValidacao;
  final List<TextInputFormatter>? inputKeyboardType;
  final TextEditingController controller;
  final TextInputType keyboardType;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;
  double? width;
  double? height;
  Color? cor;
  String nomeDoCampo;

  CustomTextInputWithText({
    Key? key,
    this.obscureText,
    this.inputKeyboardType,
    required this.controller,
    required this.textoValidacao,
    required this.keyboardType,
    required this.nomeDoCampo,
    required this.onEditingComplete,
    this.onChanged,
    this.cor, this.height, this.width
  }) : super(key: key);

  @override
  State<CustomTextInputWithText> createState() => _CustomTextInputWithTextState();
}

class _CustomTextInputWithTextState extends State<CustomTextInputWithText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.nomeDoCampo,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.obscureText == null ? widget.obscureText == false : widget.obscureText == true,
            controller: widget.controller,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, digite ${widget.textoValidacao}.";
              }
              return null;
            },
            style: Fontes.tamanhoPadrao,
            inputFormatters: widget.inputKeyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Cores.azul
                ),
              ),
            ),
            keyboardType: widget.keyboardType,
          ),
        ),
      ],
    );
  }
}
