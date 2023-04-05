import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class SolicitacaoDeCancelamento extends StatefulWidget {
  const SolicitacaoDeCancelamento({Key? key}) : super(key: key);

  @override
  State<SolicitacaoDeCancelamento> createState() => _SolicitacaoDeCancelamentoState();
}

class _SolicitacaoDeCancelamentoState extends State<SolicitacaoDeCancelamento> {
  bool cpfVerificado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Exames",
          style: TextStyle(fontSize: 45),
        ),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          );
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
