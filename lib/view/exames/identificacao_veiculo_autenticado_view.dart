import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_alert_sucess.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_information_widget.dart';


class IdentificacaoVeiculoAutenticado extends StatefulWidget {
  const IdentificacaoVeiculoAutenticado({Key? key}) : super(key: key);

  @override
  State<IdentificacaoVeiculoAutenticado> createState() => _IdentificacaoVeiculoAutenticadoState();
}

class _IdentificacaoVeiculoAutenticadoState extends State<IdentificacaoVeiculoAutenticado> {
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

    return CustomScaffold(textAppBar: "Exames", body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const CustomAlertSucess(text: "Veículo autenticado com sucesso!"),
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Identificação do candidato",
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
          child: Text("Solicite o documento do candidato e confira se os dados conferem.", style: TextStyle(fontSize: 32)),
        ),
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Text("Para iniciar o exame é necessário realizar o reconhecimento biométrico facial do candidato:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 41), textAlign: TextAlign.center,),
        ),
        CustomButtonFull(name: "Avançar", onClick: () {
          setState(() {
            Navigator.pushNamed(context, '/identificacaoCandidato', arguments: {
              "nome": nome,
              "localDoExame": localDoExame,
              "categoria": categoria,
              "cpf": cpf,
              "renach": renach,
              "unidadeDeTransito": unidadeDeTransito,
              "dia": dia
            });
          });
        },)
      ],
    ),);
  }
}
