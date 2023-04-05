import 'package:boleto_digital/widgets/custom_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
class CustomBoletoHeader extends StatefulWidget {
  CustomBoletoHeader(
      {Key? key,
      required this.displayTime,
      required this.dia,
      required this.categoria,
      required this.nome,
      required this.localDoExame,
        required this.temporizador,
      required this.unidadeDeTransito})
      : super(key: key);

  String displayTime;
  StreamBuilder<int> temporizador;
  String dia;
  String nome;
  String unidadeDeTransito;
  String categoria;
  String localDoExame;

  @override
  State<CustomBoletoHeader> createState() => _CustomBoletoHeaderState();
}

class _CustomBoletoHeaderState extends State<CustomBoletoHeader> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(children: [
              Text(
                "Exame Prático",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
             widget.temporizador,
            ]),
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
                CustomInformation(leftText: 'Data: ', rightText: widget.dia, leftFontSize: 18, rightFontSize: 18, padding: 0,),
                Spacer(),
                CustomInformation(leftText: '', rightText: widget.nome, rightFontSize: 18, leftFontSize: 18, padding: 0,),
              ],
            ),
            Row(
              children: [
                CustomInformation(leftText: 'Unidade de trânsito: ', rightText: widget.unidadeDeTransito, leftFontSize: 18, rightFontSize: 18, padding: 0,),
                Spacer(),
                CustomInformation(leftText: 'Categoria: ', rightText: widget.categoria, leftFontSize: 18, rightFontSize: 18, padding: 0,),
              ],
            ),
            Row(
              children: [
                CustomInformation(leftText: 'Local: ', rightText: widget.localDoExame, leftFontSize: 18, rightFontSize: 18, padding: 0,),
                Spacer(),
                CustomInformation(leftText: '', rightText: 'Auto Escola teste um', leftFontSize: 18, rightFontSize: 18, padding: 0,),
              ],
            ),
          ],
        ),
        const Divider(
          thickness: 5,
        ),
      ],
    );
  }
}
