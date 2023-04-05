import 'dart:convert';

import 'package:boleto_digital/model/exames/lista_de_exames_model.dart';
import 'package:boleto_digital/model/relatorios/relatorios_de_exames_pratico_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/custom_button_half.dart';
import '../../widgets/custom_colors.dart';
import '../../widgets/custom_datefield_state.dart';
import '../../widgets/custom_dropdownbutton.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_url_mock.dart';

class RelatoriosDeExamesPratico extends StatefulWidget {
  const RelatoriosDeExamesPratico({Key? key}) : super(key: key);
  static const routeName = '/relatoriosExames/relatoriosDeExamesPratico';

  @override
  State<RelatoriosDeExamesPratico> createState() => _RelatoriosDeExamesPraticoState();
}

class _RelatoriosDeExamesPraticoState extends State<RelatoriosDeExamesPratico> {
  bool isVisible = false;
  final controllerDataInicio = TextEditingController(text: "01/01/2022");
  final controllerDataFim = TextEditingController(text: "01/01/2022");
  final controllerSuperintendencia = TextEditingController();
  final controllerUnidadeTransito = TextEditingController();
  final controllerLocal = TextEditingController();
  final controllerCategoriaExame = TextEditingController();
  final controllerCfc = TextEditingController();
  final controllerExaminador = TextEditingController();
  int controllerRegistro = 0;
  int parametroLocal = 0;
  int parametroCfc = 0;
  String selectSuperintendencia = "Selecione ou pesquise a superintendencia";
  String selectUnidadeTransito = "Selecione ou pesquise a unidade de trânsito";
  String selectLocal = "Selecione ou pesquise o local";
  String selectCategoriaExame = "Selecione ou pesquise a categoria do exame";
  String selectCfc = "Selecione ou pesquise o CFC";
  String selectExaminador = "Selecione ou pesquise o examinador";
  final formkey = GlobalKey<FormState>();
  double tamanhoSuperintendencia = 50;
  double tamanhoLocal = 50;
  double tamanhoUnidadeTransito = 50;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Relatórios de exames",
      body: StreamBuilder<List<RelatorioExamesModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErroTempoLimiteApi();
          } else if (snapshot.hasData) {
            final listaDeRelatorios = snapshot.data!;
            return ListView(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "PESQUISA DE RELATÓRIO DE EXAME PRÁTICO",
                          style: TextStyle(color: Cores.azul, fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          "Informe o período: ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 30),
                          Text(
                            "Data início*:",
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(width: 90),
                          Text(
                            "Data fim*:",
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(width: 100),
                          Text(
                            "Superintendência*:",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomDateField(
                            controller: controllerDataInicio,
                          ),
                          CustomDateField(
                            controller: controllerDataFim,
                          ),
                          Container(
                            height: tamanhoSuperintendencia,
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownSearch<String>(
                              items: [listaDeRelatorios[0].superintendencia],
                              validator: (String? item) {
                                if (item == selectSuperintendencia) {
                                  tamanhoSuperintendencia = 69;
                                  return 'Selecione uma das opções.';
                                }
                              },
                              selectedItem: selectSuperintendencia,
                              onChanged: (value) {
                                controllerSuperintendencia.text = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\n\t\t\t Unidade de trânsito*:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          CustomDropDownButton(
                              hintText: selectUnidadeTransito,
                              heightValue: tamanhoUnidadeTransito,
                              paddingValue: const EdgeInsets.only(left: 20, right: 380),
                              functionValidator: (String? item) {
                                if (item == selectUnidadeTransito) {
                                  tamanhoUnidadeTransito = 69;
                                  return 'Selecione uma das opções.';
                                }
                              },
                              valor: [
                                listaDeRelatorios[0].unidadeTransitos[0].unidadeTransito,
                                listaDeRelatorios[0].unidadeTransitos[1].unidadeTransito,
                                listaDeRelatorios[0].unidadeTransitos[2].unidadeTransito,
                              ],
                              functionOnChanged: (value) {
                                controllerUnidadeTransito.text = value!;
                                setState(() {
                                  if (controllerUnidadeTransito.text == "CIR - Aruja") {
                                    parametroLocal = 0;
                                  }
                                  if (controllerUnidadeTransito.text == "CIR - Belém") {
                                    parametroLocal = 1;
                                  }
                                  if (controllerUnidadeTransito.text == "CIR - São Paulo") {
                                    parametroLocal = 2;
                                  }
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\n\t\t\t Local*:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          CustomDropDownButton(
                              hintText: selectLocal,
                              heightValue: tamanhoLocal,
                              paddingValue: const EdgeInsets.only(left: 20, right: 380),
                              functionValidator: (String? item) {
                                if (item == selectLocal) {
                                  tamanhoLocal = 69;
                                  return 'Selecione uma das opções.';
                                }
                              },
                              valor: [listaDeRelatorios[0].locais[parametroLocal].local],
                              functionOnChanged: (value) {
                                controllerLocal.text = value!;
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\n\t\t\t Categoria do exame:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          CustomDropDownButton(
                              hintText: selectCategoriaExame,
                              paddingValue: const EdgeInsets.only(left: 20, right: 380),
                              valor: [
                                listaDeRelatorios[0].categoriasExame[0].categoriaExame,
                                listaDeRelatorios[0].categoriasExame[1].categoriaExame
                              ],
                              functionOnChanged: (value) {
                                controllerCategoriaExame.text = value!;
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\n\t\t\t CFC:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          CustomDropDownButton(
                              hintText: selectCfc,
                              paddingValue: const EdgeInsets.only(left: 20, right: 380),
                              valor: [listaDeRelatorios[0].cfcs[parametroLocal].cfc],
                              functionOnChanged: (value) {
                                controllerCfc.text = value!;
                                if (controllerCfc.text == "CFC - Aruja") {
                                  parametroCfc = 0;
                                }
                                if (controllerCfc.text == "CFC - Belém") {
                                  parametroCfc = 1;
                                }
                                if (controllerCfc.text == "CFC - São Paulo") {
                                  parametroCfc = 2;
                                }
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\n\t\t\t Examinador:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          CustomDropDownButton(
                            hintText: selectExaminador,
                            paddingValue: const EdgeInsets.only(left: 20, right: 380),
                            valor: [
                                listaDeRelatorios[parametroLocal].examinador,
                            ],
                            functionOnChanged: (value) {
                              controllerExaminador.text = value!;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CustomButtonHalf(
                              name: "LIMPAR DADOS",
                              colors: Cores.azul,
                              onClick: () {
                                setState(() {
                                  isVisible = false;
                                  tamanhoSuperintendencia = 50;
                                  tamanhoUnidadeTransito = 50;
                                  tamanhoLocal = 50;
                                  selectSuperintendencia = "Selecione ou pesquise a superintendencia ";
                                  controllerSuperintendencia.clear();
                                  selectUnidadeTransito = "Selecione ou pesquise a unidade de trânsito ";
                                  controllerUnidadeTransito.clear();
                                  selectLocal = "Selecione ou pesquise o local ";
                                  controllerLocal.clear();
                                  selectCategoriaExame = "Selecione ou pesquise a categoria do exame ";
                                  controllerCategoriaExame.clear();
                                  selectCfc = "Selecione ou pesquise o CFC ";
                                  controllerCfc.clear();
                                  selectExaminador = "Selecione ou pesquise o examinador ";
                                  controllerExaminador.clear();
                                });
                              }),
                          CustomButtonHalf(
                              name: "GERAR RELATÓRIO",
                              onClick: () {
                                setState(() {
                                  if (formkey.currentState!.validate()) {
                                    tamanhoSuperintendencia = 50;
                                    tamanhoUnidadeTransito = 50;
                                    tamanhoLocal = 50;
                                    if (parametroLocal == 0) {
                                      if (controllerCategoriaExame.text == "Categoria A") {
                                        controllerRegistro = 0;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text == "Categoria B") {
                                        controllerRegistro = 1;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text.isEmpty) {
                                        controllerRegistro = 5;
                                        isVisible = true;
                                      }
                                    }
                                    if (parametroLocal == 1) {
                                      if (controllerCategoriaExame.text == "Categoria A") {
                                        controllerRegistro = 2;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text == "Categoria B") {
                                        controllerRegistro = 3;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text.isEmpty) {
                                        controllerRegistro = 6;
                                        isVisible = true;
                                      }
                                    }
                                    if (parametroLocal == 2) {
                                      if (controllerCategoriaExame.text == "Categoria A") {
                                        controllerRegistro = 4;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text == "Categoria B") {
                                        controllerRegistro = 5;
                                        isVisible = true;
                                      }
                                      if (controllerCategoriaExame.text.isEmpty) {
                                        controllerRegistro = 2;
                                        isVisible = true;
                                      }
                                    }
                                  }
                                });
                              })
                        ],
                      ),
                      SizedBox(height: 60),
                      Visibility(
                          visible: isVisible,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Resultado da pesquisa",
                                  style: TextStyle(
                                    color: Cores.azul,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              StreamBuilder<List<RelatorioExamesModel>>(
                                stream: readUsers(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final listaDeRelatorios = snapshot.data!;
                                    return ListTile(
                                      title: Text(
                                        "\t\tForam encontrados "
                                        "${listaDeRelatorios[0].qntdRelatorios[controllerRegistro].qntdRelatorio}"
                                        " registros",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("Erro");
                                  }
                                  return Container(
                                    height: 50,
                                    width: 380,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownSearch<String>(
                                      items: ["ERRO"],
                                      selectedItem: selectSuperintendencia,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 300,
                                  ),
                                  TextButton.icon(
                                      style: TextButton.styleFrom(
                                          fixedSize: const Size(300, 50), side: BorderSide(color: Cores.azul, width: 1)),
                                      label: Text(
                                        'BAIXAR RELATÓRIO',
                                        style: TextStyle(fontSize: 25, color: Cores.azul),
                                      ),
                                      icon: Icon(
                                        Icons.file_download_outlined,
                                        size: 35,
                                        color: Cores.azul,
                                      ),
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            );
          }
          return const CirculoDeProgresso();
        },
      ),
    );
  }

  Stream<List<RelatorioExamesModel>> readUsers() => FirebaseFirestore.instance
      .collection('relatoriosDeExames')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => RelatorioExamesModel.fromJson(doc.data())).toList());
}
