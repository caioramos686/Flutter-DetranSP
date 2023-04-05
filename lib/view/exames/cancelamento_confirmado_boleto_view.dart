import 'package:boleto_digital/widgets/custom_alert_sucess.dart';
import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class CancelamentoConfirmadoBoleto extends StatefulWidget {
  const CancelamentoConfirmadoBoleto({Key? key}) : super(key: key);

  @override
  State<CancelamentoConfirmadoBoleto> createState() => _CancelamentoConfirmadoBoletoState();
}

class _CancelamentoConfirmadoBoletoState extends State<CancelamentoConfirmadoBoleto> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      textAppBar: 'Exames',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
            margin: EdgeInsets.only(bottom: 40),
            height: 250,
              child: CustomAlertSucess(
                  text:
                      'Solicitação de cancelamento do exame do candidato enviado com sucesso ao presidente da banca.')),
          CustomButtonFull(name: 'VOLTAR AO MENU', onClick: () {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          },)
        ],
      ),
    );
  }
}
