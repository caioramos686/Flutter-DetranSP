import 'package:boleto_digital/widgets/custom_alert_sucess.dart';
import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class ExameFinalizadoBoleto extends StatefulWidget {
  const ExameFinalizadoBoleto({Key? key}) : super(key: key);

  @override
  State<ExameFinalizadoBoleto> createState() => _ExameFinalizadoBoletoState();
}

class _ExameFinalizadoBoletoState extends State<ExameFinalizadoBoleto> {
  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String nome = modalRoute["nome"].toString();
    String categoria = modalRoute["categoria"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String dia = modalRoute["dia"].toString();
    String displayTime = modalRoute["displayTime"].toString();

    return CustomScaffold(textAppBar: "Boleto", body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Exame Prático",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "$displayTime",
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    "Examinador Teste um",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "Protocolo do exame: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("44.444.4444", style: TextStyle(fontSize: 18))
                ],
              ),
              Row(
                children: [
                  Text(
                    "Data: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    dia,
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    nome,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Unidade de trânsito: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(unidadeDeTransito, style: TextStyle(fontSize: 18)),
                  Spacer(),
                  Text(
                    "Categoria: $categoria",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Local: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(localDoExame, style: TextStyle(fontSize: 18)),
                  Spacer(),
                  const Text(
                    "Auto Escola teste um",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Falta Média - 2 pontos: ",
                    style: TextStyle(fontSize: 24, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Fazer a conversão corretamente",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Total de 2 pontos",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomAlertSucess(text: "APROVADO com sucesso!",),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Por favor informe ao candidato o resultado e que todos os detalhes serão enviados para o e-mail cadastrado e do CFC",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Solicite a assinatura de participação do candidato.",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButtonFull(name: "Avançar", onClick: () {
                  setState(() {
                    Navigator.pushNamed(context, "/assinaturaBoleto", arguments: {"nome": nome});
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
