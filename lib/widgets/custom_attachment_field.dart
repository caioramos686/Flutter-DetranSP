import 'package:flutter/material.dart';

class CustomAttachmentField extends StatelessWidget {
  const CustomAttachmentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).devicePixelRatio * 400,
      child: const TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
      ),
    );
  }
}
