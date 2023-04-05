import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_information_widget.dart';
import 'package:boleto_digital/widgets/custom_progress_circle.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_text_input_with_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../view-model/exames/placa_view_model.dart';
import '../../widgets/custom_colors.dart';

class IdentificacaoVeiculo extends StatefulWidget {
  const IdentificacaoVeiculo({Key? key}) : super(key: key);

  @override
  State<IdentificacaoVeiculo> createState() => _IdentificacaoVeiculoState();
}

class _IdentificacaoVeiculoState extends State<IdentificacaoVeiculo> {
  bool placaEscrita = false;
  bool verLADV = true;
  final placaVeiculo = TextEditingController();
  String placaCerta = "";
  String placaErrada = "";
  String placaInput = "";

  bool placaValida = false;
  bool placaLimitada = false;
  bool placaInvalida = false;

  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "LADV do candidato",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Licença de Aprendizagem de Direção Veicular",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonFull(
                  name: "VER LADV",
                  onClick: () {},
                  colors: Cores.azul,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Identificação do veículo",
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
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "Importante",
                style: TextStyle(color: Cores.vermelhoBotao, fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Text(
                "Para realizar o exame prático é necessário informar a placa do veículo do CFC que será utilizado no percurso",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: CustomTextInputWithText(
                controller: placaVeiculo,
                textoValidacao: "a placa do veículo",
                keyboardType: TextInputType.visiblePassword,
                nomeDoCampo: "PLACA DO VEÍCULO",
                onChanged: (value) {
                  setState(() {
                    placaVeiculo.value = placaVeiculo.value.copyWith(
                      text: value.toUpperCase(),
                      selection: TextSelection(baseOffset: value.length, extentOffset: value.length),
                      composing: TextRange.empty,
                    );

                    print(placaVeiculo.value);
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    placaEscrita = true;
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _procuraPlaca();
                    });
                  });
                },
              ),
            ),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: fetchPlacasDisponiveis(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: fetchPlacasLimite(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        placaInvalida = true;
                        placaLimitada = false;
                        placaValida = false;
                        return Container();
                      } else if (snapshot.hasData) {
                        placaLimitada = true;
                        placaValida = false;
                        placaInvalida = false;
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  );
                } else if (snapshot.hasData) {
                  placaValida = true;
                  placaInvalida = false;
                  placaLimitada = false;
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            placaVeiculo.text.isEmpty == false
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _procuraPlaca();
                        setState(() {
                          if (placaLimitada == true) {
                            Navigator.pushNamed(context, "/erroLimiteDeCarros");
                          } else if (placaValida == true) {
                            Navigator.pushNamed(context, '/veiculoAutenticado', arguments: {
                              "nome": nome,
                              "localDoExame": localDoExame,
                              "categoria": categoria,
                              "cpf": cpf,
                              "renach": renach,
                              "unidadeDeTransito": unidadeDeTransito,
                              "dia": dia
                            });
                          } else if (placaInvalida == true) {
                            Navigator.pushNamed(context, "/erroCarroInvalido");
                          }
                        });
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      width: double.infinity,
                      height: 80,
                      color: Cores.azul,
                      child: const Center(
                        child: Text(
                          "Avançar",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      width: double.infinity,
                      height: 80,
                      color: Colors.grey,
                      child: const Center(
                        child: Text(
                          "Avançar",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchPlacasDisponiveis() async {
    final firebase =
        await FirebaseFirestore.instance.collection('carrosDisponiveis').doc(placaVeiculo.text).get();
    return firebase;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchPlacasLimite() async {
    final firebase =
        await FirebaseFirestore.instance.collection('carrosIndisponiveis').doc(placaVeiculo.text).get();
    return firebase;
  }

  /*
  onEditingComplete: () {
                  setState(() {
                    placaEscrita = true;
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _procuraPlaca();
                    });
                  });
                },

   onChanged: (value) {
                  setState(() {
                    placaVeiculo.value = placaVeiculo.value.copyWith(
                        text: value.toUpperCase(),
                        selection: TextSelection(baseOffset: value.length, extentOffset: value.length),
                        composing: TextRange.empty);
                  });
                },
   */

  Future _procuraPlaca() async {
    final resultaCandidato = await PlacaViewModel().achaPlaca();

    placaCerta = resultaCandidato.placaCerta;
    placaErrada = resultaCandidato.placaErrada;
  }
}
/*
* listaDePlacas.forEach((element) {
                    if(element.placa == "CRI1920"){
                      Navigator.pushNamed(context, "/erroLimiteDeCarros");
                    } else if(element.placa == "IRC0291"){
                      verLADV = true;
                    } else{
                      Navigator.pushNamed(context, "/erroCarroInvalido");
                    }
                });
* */
