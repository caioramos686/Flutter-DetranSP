import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class ErroLimiteDeCarros extends StatefulWidget {
  const ErroLimiteDeCarros({Key? key}) : super(key: key);

  @override
  State<ErroLimiteDeCarros> createState() => _ErroLimiteDeCarrosState();
}

class _ErroLimiteDeCarrosState extends State<ErroLimiteDeCarros> {
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
          Container(
            decoration: BoxDecoration(
                color: const Color(0x5BF50000),
                border: Border.all(
                  width: 1.5,
                  color: Colors.red,
                )),
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: const Text(
              "Veículo atingiu a quantidade máxima permitida de utilização por CFC no dia, por favor verifique se os dados informados estão corretos.",
              style: TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                width: double.infinity,
                height: 50,
                color: Cores.azul,
                child: const Center(
                    child: Text(
                      "Voltar",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ))),
          )
        ],
      ),
    );
  }
}
