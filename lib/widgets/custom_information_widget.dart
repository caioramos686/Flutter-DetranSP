import 'package:flutter/material.dart';

class CustomInformation extends StatelessWidget {
  CustomInformation({Key? key, this.padding = 8, required this.leftText, this.leftFontSize = 24, required this.rightText, this.rightFontSize = 24}) : super(key: key);

  double padding;
  String? leftText;
  double? leftFontSize;
  String? rightText;
  double? rightFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: RichText(
        text: TextSpan(
          text: leftText,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: leftFontSize, color: Colors.black),
          children: [
            TextSpan(
              text: rightText,
              style: TextStyle(
                fontSize: rightFontSize,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
