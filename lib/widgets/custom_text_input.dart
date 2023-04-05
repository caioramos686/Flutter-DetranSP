import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  final bool? obscureText;
  final String dicaCampo;
  final List<TextInputFormatter>? inputKeyboardType;
  final TextEditingController controller;
  final TextInputType keyboardType;
  double? width;
  double? height;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  String nomeDoCampo;

  CustomTextInput({
    Key? key,
    this.obscureText,
    this.inputKeyboardType,
    required this.controller,
    required this.dicaCampo,
    required this.keyboardType,
    this.width, this.height, this.onChanged, this.onEditingComplete, required this.nomeDoCampo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nomeDoCampo,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            obscureText: obscureText == null ? obscureText == false : obscureText == true,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, digite ${dicaCampo}.";
              }
              return null;
            },
            inputFormatters: inputKeyboardType,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 5, left: 10),
              hintText: "Informe ${dicaCampo}",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
