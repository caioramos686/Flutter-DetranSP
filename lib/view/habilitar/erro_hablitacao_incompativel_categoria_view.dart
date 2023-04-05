import 'package:flutter/material.dart';
import '../../widgets/custom_alert_error.dart';
import '../../widgets/custom_button_half.dart';
import '../../widgets/custom_scaffold.dart';

class ErroHabilitacaoImcompativel extends StatelessWidget {
  const ErroHabilitacaoImcompativel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Habilitar examinador",
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const CustomAlertError(
                  text:
                  "Examinador não possuiu habilitação compativel com a categoria do exame, por favor verifique e tente novamente."
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonHalf(
                    name: "Atribuir examinador manual",
                    onClick: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButtonHalf(
                    name: "Voltar ao menu",
                    onClick: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
