import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_alert_sucess.dart';

class PresidenteHabilitado extends StatelessWidget {
  const PresidenteHabilitado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Habilitar presidente",
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const CustomAlertSucess(text: "Presidente habilitado com sucesso"),
              const SizedBox(
                height: 100,
              ),
              CustomButtonFull(
                name: "Voltar ao Menu",
                onClick: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
