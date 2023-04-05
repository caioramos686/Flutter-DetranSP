import 'package:boleto_digital/widgets/custom_alert_sucess.dart';
import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_colors.dart';
import '../../../widgets/custom_scaffold.dart';

class AssinaturaRecebidaBoleto extends StatelessWidget {
  const AssinaturaRecebidaBoleto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 150,
        ),
        CustomAlertSucess(text: "Assinatura recebida com sucesso!"),
        const SizedBox(
          height: 100,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Após enviar o exame do candidato, este será submetido a aprovação do presidente da banca",
            style: TextStyle(fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        CustomButtonFull(name: "Voltar ao Menu", onClick: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },)
      ],
    ), textAppBar: "Exames",);
  }
}
