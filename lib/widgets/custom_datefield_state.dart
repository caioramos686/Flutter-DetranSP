import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';


class CustomDateField extends StatefulWidget {
  TextEditingController controller;

  CustomDateField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}
class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).devicePixelRatio * 120,
      height: MediaQuery.of(context).devicePixelRatio * 50,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.datetime,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly, DataInputFormatter()],
      ),
    );
  }
}