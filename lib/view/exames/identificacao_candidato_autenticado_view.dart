import 'package:boleto_digital/widgets/custom_popup.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_alert_sucess.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_information_widget.dart';

class CandidatoAutenticado extends StatefulWidget {
  const CandidatoAutenticado({Key? key}) : super(key: key);

  @override
  State<CandidatoAutenticado> createState() => _CandidatoAutenticadoState();
}

class _CandidatoAutenticadoState extends State<CandidatoAutenticado> {
  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String nome = modalRoute["nome"].toString();
    String categoria = modalRoute["categoria"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String cpf = modalRoute["cpf"].toString();
    String renach = modalRoute["renach"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String dia = modalRoute["dia"].toString();

    return CustomScaffold(
      textAppBar: "Exames",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAlertSucess(text: "Candidato autenticado com sucesso!"),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Exame prático",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInformation(leftText: "Nome: ", rightText: nome),
                CustomInformation(leftText: "CPF: ", rightText: cpf),
                CustomInformation(leftText: "Categoria: ", rightText: categoria),
                CustomInformation(leftText: "CFC: ", rightText: localDoExame),
                CustomInformation(leftText: "Renach: ", rightText: renach),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
            child: Center(
                child: Text("Instruções", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
          ),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              "Para a avaliação, assinalar de acordo com as faltas cometidas pelo candidato durante o exame prático de direção veicular. Conforme"
              "a Resolução n° 168/04 do Contran, o candidato que cometer falta eliminatória ou cuja a soma dos pontos negativos ultrapassar a "
              "3 (três) será considerado reprovado",
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          CustomButtonFull(
            name: "INICIAR EXAME PRÁTICO",
            onClick: () {
              setState(
                () {
                  showDialog(
                    context: context,
                    builder: (_) => customPopUp(
                      text:
                          "Para continuar, ative a localização do dispositivo, que usa o serviço de localização",
                      navigator: '/boleto',
                      arguments: {
                        "nome": nome,
                        "localDoExame": localDoExame,
                        "categoria": categoria,
                        "cpf": cpf,
                        "renach": renach,
                        "unidadeDeTransito": unidadeDeTransito,
                        "dia": dia
                      },
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
