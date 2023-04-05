import 'package:flutter/material.dart';

import 'custom_fonts.dart';
import 'custom_colors.dart';

class CustomScaffold extends StatelessWidget {
  final String textAppBar;
  final Widget body;
  bool aboveBottomInset;
  bool extendBodyBehindAppBar;
  bool ultimaPagina;
  CustomScaffold({Key? key, required this.textAppBar, required this.body, this.aboveBottomInset = true, this.extendBodyBehindAppBar = false, this.ultimaPagina = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: aboveBottomInset,
      appBar: AppBar(
        title: Text(
          textAppBar,
          style: Fontes.tituloAppBar,
        ),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        leading: ultimaPagina == false ? Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          );
        }) : null,
      ),
      body: body,
    );
  }
}
