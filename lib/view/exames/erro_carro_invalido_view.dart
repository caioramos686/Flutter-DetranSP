import 'package:boleto_digital/widgets/custom_alert_error.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';


class ErroCarroInvalido extends StatefulWidget {
  const ErroCarroInvalido({Key? key}) : super(key: key);

  @override
  State<ErroCarroInvalido> createState() => _ErroCarroInvalidoState();
}

class _ErroCarroInvalidoState extends State<ErroCarroInvalido> {
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
          CustomAlertError(text: "Veículo com cadastro inválido, por favor verifique se os dados informados estão corretos."),
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
