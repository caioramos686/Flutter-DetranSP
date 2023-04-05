import 'dart:convert';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/exames/exames_em_andamento_model.dart';
import '../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_url_mock.dart';
import 'exames_em_andamento_presidente_view.dart';

class Exames extends StatefulWidget {
  const Exames({Key? key}) : super(key: key);

  @override
  State<Exames> createState() => _ExamesState();
}

class _ExamesState extends State<Exames> {
  List<ExamesAndamentoModel> listaExamesModel = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Exames",
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Selecione:",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomNavigationButton(
            name: "Aplicar exame",
            onClick: () {
              Navigator.pushNamed(context, "/escolherExame");
            },
          ),
          CustomNavigationButton(
            name: "Exames em andamento",
            onClick: () {
              Navigator.pushNamed(context, "/listaExamesConcluidos");
            },
          ),
          CustomNavigationButton(
            name: "Validados",
            onClick: () {},
          ),
        ],
      ),
    );
  }
}



Future<List<ExamesAndamentoModel>> getALL() async {
  String url = "${UrlMock.urlCariatte}/examesEmAndamento";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  List<ExamesAndamentoModel> exames = [];
  for (var exameUnico in responseData) {
    ExamesAndamentoModel exame = ExamesAndamentoModel(
        examinador: exameUnico["examinador"],
        candidato: exameUnico["candidato"],
        categoria: exameUnico["categoria"],
        resultado: exameUnico["resultado"],
        estadoBoolean: exameUnico = false,);

    exames.add(exame);
  }
  return exames;
}
