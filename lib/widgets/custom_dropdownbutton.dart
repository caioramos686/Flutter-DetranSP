import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final String hintText;
  final List<String> valor;//alterar para Text
  var functionOnChanged;
  var functionValidator;
  var heightValue;
  var widthValue;
  EdgeInsetsGeometry? paddingValue;

  CustomDropDownButton({
    Key? key,
    required this.hintText,
    required this.valor,
    required this.functionOnChanged,
    this.functionValidator,
    this.heightValue,
    this.widthValue,
    this.paddingValue
  }) : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}
class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightValue == null ? MediaQuery.of(context).devicePixelRatio * 50 : MediaQuery.of(context).devicePixelRatio * widget.heightValue,
      width: widget.widthValue == null ? MediaQuery.of(context).devicePixelRatio * 800 : MediaQuery.of(context).devicePixelRatio * widget.widthValue,
      padding: widget.paddingValue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownSearch<String>(
        validator: widget.functionValidator,
        items: widget.valor,
        selectedItem: widget.hintText,
        onChanged: widget.functionOnChanged,
      ),
    );
  }
}



