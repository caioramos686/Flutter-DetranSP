import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_text_title.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_navigation_button.dart';

class Habilitar extends StatefulWidget {
  const Habilitar({Key? key}) : super(key: key);

  @override
  State<Habilitar> createState() => _HabilitarState();
}

class _HabilitarState extends State<Habilitar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        textAppBar: "Habilitar",
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CustomTextTitle(
                textTitle: "Selecione qual perfil quer habilitar:"
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomNavigationButton(
            name: "Examinador",
            onClick: () {
              Navigator.pushNamed(context, '/habilitar/habilitarExaminador');
            },
          ),
          CustomNavigationButton(
            name: "Presidente da Banca",
            onClick: () {
              Navigator.pushNamed(context, '/habilitar/habilitarPresidente');
            },
          ),
        ],
      ),),
    );
  }
}
