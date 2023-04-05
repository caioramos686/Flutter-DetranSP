import 'package:boleto_digital/widgets/custom_buttom.dart';
import 'package:boleto_digital/widgets/custom_information_widget.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_colors.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/custom_table.dart';

class BuscaCandidatoExame extends StatefulWidget {
  const BuscaCandidatoExame({Key? key}) : super(key: key);

  @override
  State<BuscaCandidatoExame> createState() => _BuscaCandidatoExameState();
}

class _BuscaCandidatoExameState extends State<BuscaCandidatoExame> {
  final cpfController = TextEditingController();
  String nome = "";
  String horario = "";
  String categoriaCandidato = "";
  String cpf = "";
  String renach = "";

  bool isChecked = false;
  bool candidatoVisibible = false;

  @override
  void initState() {
    super.initState();
  }

  Stream? str;

  String cpfInput = " ";

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String categoria = modalRoute["categoria"].toString();

    return CustomScaffold(
      textAppBar: "Exames",
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Exame Prático",
              style: TextStyle(fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInformation(leftText: "Data: ", rightText: dia),
                CustomInformation(leftText: "Unidade de trânsito:" , rightText: unidadeDeTransito),
                CustomInformation(leftText: 'Local do Exame: ', rightText: localDoExame),
                CustomInformation(leftText: "Categoria: ", rightText: categoria),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomSearchField(
              name: "Busque o Candidato pelo número do CPF",
              controller: cpfController,
              keyboardType: TextInputType.number,
              inputKeyboardType: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              onClick: () async {
                setState(() {
                  cpfInput = cpfController.text.replaceAll("-", "").replaceAll(".", "");
                  FocusScope.of(context).unfocus();
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      candidatoVisibible = true;
                    });
                  });
                });
                await readExames();
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: candidatoVisibible,
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: candidatoVisibible == true ? readExames() : null,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErroTempoLimiteApi(
                    nome: 'CPF',
                  );
                } else if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 10),
                          child: Text(
                            "Selecione o candidato:",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: CustomTable(
                            bodyWidget: List.generate(
                              1,
                              (index) {
                                return TableRow(
                                  children: [
                                    BoletoCheckbox(
                                      value: isChecked,
                                      onClick: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    TextTableRow(
                                      nome: snapshot.data!['nome'],
                                    ),
                                    TextTableRow(
                                      nome: snapshot.data!['categoria'],
                                    ),
                                    TextTableRow(
                                      nome: snapshot.data!['horario'],
                                    ),
                                  ],
                                );
                              },
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(0.3),
                              1: FlexColumnWidth(1.1),
                              2: FlexColumnWidth(0.8),
                              3: FlexColumnWidth(0.8),
                            },
                            headerWidget: [
                              TextTableRow(
                                nome: "",
                              ),
                              TextTableRow(
                                nome: "Nome",
                                color: Cores.azulClaro,
                              ),
                              TextTableRow(
                                nome: "Categoria",
                                color: Cores.azulClaro,
                              ),
                              TextTableRow(
                                nome: "Horario",
                                color: Cores.azulClaro,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return CirculoDeProgresso();
                }
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          candidatoVisibible == true
              ? Visibility(
                  visible: !isChecked,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      "* É OBRIGATÓRIO ESCOLHER UM CANDIDATO ACIMA PARA CONTINUAR",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
          isChecked == true
              ? const SizedBox(
                  height: 16,
                )
              : const SizedBox(
                  height: 0,
                ),
          CustomGreyButton(
            name: "Avançar",
            changeColor: isChecked,
            onClick: () {
              Navigator.pushNamed(
                context,
                '/identificacaoVeiculo',
                arguments: {
                  "dia": dia,
                  "unidadeDeTransito": unidadeDeTransito,
                  "nome": nome,
                  "localDoExame": localDoExame,
                  "categoria": categoria,
                  "cpf": cpf,
                  "renach": renach
                },
              );
            },
          )
        ],
      ),
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readExames() async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection('candidato').doc(cpfInput).get();

    nome = snap['nome'];
    categoriaCandidato = snap['categoria'];
    horario = snap['horario'];
    cpf = snap['cpf'];
    renach = snap['renach'];

    return snap;
  }
}

/*

 */
