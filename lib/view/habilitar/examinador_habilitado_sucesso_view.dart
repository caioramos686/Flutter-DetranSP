import 'package:flutter/material.dart';
import '../../widgets/custom_alert_sucess.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_scaffold.dart';

class ExaminadorAbilitadoSucesso extends StatelessWidget {
  const ExaminadorAbilitadoSucesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Habilitar examinador",
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              const CustomAlertSucess(text: "Examinador habilitado com sucesso"),
              const SizedBox(
                height: 150,
              ),
              CustomButtonFull(
                name: "Voltar ao menu",
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
