import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_alert_sucess.dart';
import '../../../widgets/custom_button_full.dart';

class AssinaturaRecebidaIntercorrencia extends StatelessWidget {
  const AssinaturaRecebidaIntercorrencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      ultimaPagina: true,
      extendBodyBehindAppBar: true,
      textAppBar: 'Exames',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAlertSucess(text: "Intercorrência salva com sucesso!"),
          const SizedBox(
            height: 100,
          ),
          CustomButtonFull(name: "Voltar ao Menu", onClick: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },)
        ],
      ),
    );
  }
}
