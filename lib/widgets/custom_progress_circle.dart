import 'package:flutter/material.dart';

class CirculoDeProgresso extends StatelessWidget {
  const CirculoDeProgresso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: CircularProgressIndicator(
          strokeWidth: 8,
        ),
      ),
    );
  }
}
