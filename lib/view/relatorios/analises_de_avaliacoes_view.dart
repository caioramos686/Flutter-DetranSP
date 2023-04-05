import 'dart:convert';

import 'package:boleto_digital/widgets/custom_dropdownbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/relatorios/analises_de_exames_model.dart';
import '../../widgets/custom_button_Quarter.dart';
import '../../widgets/custom_colors.dart';
import '../../widgets/custom_datachart.dart';
import '../../widgets/custom_datefield_state.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_url_mock.dart';

class AnalisesDeAvaliacoes extends StatefulWidget {
  static const routeName = '/relatoriosExames/analisesDeAvaliacoes';
  const AnalisesDeAvaliacoes({Key? key}) : super(key: key);

  @override
  State<AnalisesDeAvaliacoes> createState() => _AnalisesDeAvaliacoesState();
}

class _AnalisesDeAvaliacoesState extends State<AnalisesDeAvaliacoes> {
  bool isVisibleDia = false;
  bool isVisibleMes = false;
  int diaA =  0;
  int diaB = 0;
  final controllerTipoAnalise = TextEditingController();
  final controllerDataInicial = TextEditingController();
  final controllerDataFinal = TextEditingController();
  final controllerUnidadeTransito = TextEditingController();
  final controllerCategoriaExame = TextEditingController();
  final dataInicioController = TextEditingController();
  final dataFimController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String select = "Selecione";


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(textAppBar: "Análises de avaliações",
        body: StreamBuilder<List<AnaliseExamesModel>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final listaDeRelatorio = snapshot.data!;
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text(
                      "ANÁLISES AVALIAÇÕES",
                      style: TextStyle(
                          color: Cores.azul,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 11),
                      Text(
                        "Tipo de análise*:",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 45),
                      Text(
                        "Data início*:",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 50),
                      Text(
                        "Data fim*:",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 68),
                      Text(
                        "Unidade de trânsito*:",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Categoria do exame:",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      CustomDropDownButton(
                          hintText: select,
                          widthValue: 150,
                          valor: ["Por dia", "Por mês"],
                          functionOnChanged: (value){
                            if(value == "Por dia"){
                              controllerTipoAnalise.text = "0";
                              controllerDataInicial.text = "01/01/2022";
                              controllerDataFinal.text = "02/01/2022";
                            }
                            if(value == "Por mês"){
                              controllerTipoAnalise.text = "1";
                              controllerDataInicial.text = "01/2022";
                              controllerDataFinal.text = "01/2022";
                            }
                          }),
                      SizedBox(width: 20),
                      CustomDateField(controller: controllerDataInicial),
                      SizedBox(width: 20),
                      CustomDateField(controller: controllerDataFinal),
                      SizedBox(width: 25),
                      CustomDropDownButton(
                          hintText: select,
                          widthValue: 150,
                          valor: [listaDeRelatorio[0].unidadeTransitos[0].unidadeTransito,
                            listaDeRelatorio[0].unidadeTransitos[1].unidadeTransito,
                            listaDeRelatorio[0].unidadeTransitos[2].unidadeTransito],
                          functionOnChanged: (value){
                            controllerUnidadeTransito.text = value!;
                          }),
                      SizedBox(width: 20),
                      CustomDropDownButton(
                          hintText: select,
                          widthValue: 150,
                          valor: [listaDeRelatorio[0].categoriasExame[0].categoriaExame,
                            listaDeRelatorio[0].categoriasExame[1].categoriaExame,],
                          functionOnChanged: (value){
                            controllerCategoriaExame.text = value!;
                          }),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CustomButtonQuarter(
                            name: "LIMPAR",
                            colors: Cores.azul,
                            onClick: (){
                              setState(() {
                                isVisibleDia = false;
                                isVisibleMes = false;
                                select = "Selecione ";
                                controllerDataInicial.clear();
                                controllerDataFinal.clear();
                                controllerTipoAnalise.clear();
                                controllerUnidadeTransito.clear();
                                controllerCategoriaExame.clear();
                              });
                            },),
                          const SizedBox(width: 30),
                          CustomButtonQuarter(
                              name: "PESQUISAR",
                              colors: Cores.azul,
                              onClick: (){
                                setState(() {
                                  if(controllerTipoAnalise.text.isEmpty ||
                                      controllerDataInicial.text.isEmpty ||
                                      controllerDataFinal.text.isEmpty ||
                                      controllerUnidadeTransito.text.isEmpty ||
                                      controllerCategoriaExame.text.isEmpty) {
                                    isVisibleDia = false;
                                    isVisibleMes = false;
                                  }
                                  else{
                                    if(controllerTipoAnalise.text == "0"){
                                      if(controllerUnidadeTransito.text == "CIR - Aruja"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 10;
                                          diaB = 8;
                                        }
                                        else {
                                          diaA = 8;
                                          diaB = 9;
                                        }
                                      }
                                      if(controllerUnidadeTransito.text == "CIR - Belém"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 11;
                                          diaB = 8;
                                        }
                                        else {
                                          diaA = 7;
                                          diaB = 5;
                                        }
                                      }
                                      if(controllerUnidadeTransito.text == "CIR - São Paulo"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 11;
                                          diaB = 7;
                                        }
                                        else {
                                          diaA = 7;
                                          diaB = 11;
                                        }
                                      }
                                      isVisibleDia = true;
                                      isVisibleMes = false;
                                    }
                                    if(controllerTipoAnalise.text == "1"){
                                      if(controllerUnidadeTransito.text == "CIR - Aruja"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 70;
                                          diaB = 74;
                                        }
                                        else {
                                          diaA = 80;
                                          diaB = 75;
                                        }
                                      }
                                      if(controllerUnidadeTransito.text == "CIR - Belém"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 78;
                                          diaB = 72;
                                        }
                                        else {
                                          diaA = 90;
                                          diaB = 87;
                                        }
                                      }
                                      if(controllerUnidadeTransito.text == "CIR - São Paulo"){
                                        if(controllerCategoriaExame.text == "Categoria A"){
                                          diaA = 87;
                                          diaB = 85;
                                        }
                                        else {
                                          diaA = 82;
                                          diaB = 76;
                                        }
                                      }
                                      isVisibleDia = false;
                                      isVisibleMes = true;
                                    }
                                  }
                                });
                              }),
                          const SizedBox(width: 11),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Visibility(
                      visible: isVisibleDia,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "\t\tUsuário teste 01",
                              style: TextStyle(fontSize: 25,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "\tMédia das notas das Avaliações por dia",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                ColumnSeries<ChartData, String>(
                                  name: "Resultado",
                                  color: Colors.blueAccent,
                                  dataSource: [
                                    ChartData("${controllerDataInicial.text}", diaA, Cores.azul),
                                    ChartData("${controllerDataFinal.text}", diaB, Colors.yellowAccent),
                                  ],
                                  xValueMapper: (ChartData dados, _) => dados.valueX,
                                  yValueMapper: (ChartData dados, _) => dados.valueY,
                                  pointColorMapper: (ChartData dados, _) => dados.cor,
                                  dataLabelSettings: DataLabelSettings(isVisible: true, labelPosition: ChartDataLabelPosition.outside),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 300,),
                              TextButton.icon(
                                  style: TextButton.styleFrom(
                                      fixedSize: const Size(300, 50),
                                      side: BorderSide(color: Cores.azul, width: 1)
                                  ),
                                  label: Text('BAIXAR ANÁLISE', style: TextStyle(fontSize: 25, color: Cores.azul),),
                                  icon: Icon(Icons.file_download_outlined, size: 35,color: Cores.azul,),
                                  onPressed: () {}
                              ),
                            ],
                          ),
                        ],
                      )),
                  Visibility(
                      visible: isVisibleMes,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "\t\tUsuário teste 01",
                              style: TextStyle(fontSize: 25,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "\tMédia das notas das Avaliações por mês",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                ColumnSeries<ChartData, String>(
                                  color: Colors.blueAccent,
                                  dataSource: [
                                    ChartData("Janeiro", diaA, Cores.azul),
                                    ChartData("Fevereiro", diaB, Cores.vermelhoBotao),
                                  ],
                                  xValueMapper: (ChartData dados, _) => dados.valueX,
                                  yValueMapper: (ChartData dados, _) => dados.valueY,
                                  pointColorMapper: (ChartData dados, _) => dados.cor,
                                  dataLabelSettings: DataLabelSettings(isVisible: true, labelPosition: ChartDataLabelPosition.outside),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 300,),
                              TextButton.icon(
                                  style: TextButton.styleFrom(
                                      fixedSize: const Size(300, 50),
                                      side: BorderSide(color: Cores.azul, width: 1)
                                  ),
                                  label: Text('BAIXAR ANÁLISE', style: TextStyle(fontSize: 25, color: Cores.azul),),
                                  icon: Icon(Icons.file_download_outlined, size: 35,color: Cores.azul,),
                                  onPressed: () {}
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              );
            } else if (snapshot.hasError) {
              return const ErroTempoLimiteApi();
            }
            return const CirculoDeProgresso();
          },
        ),);
  }

  Stream<List<AnaliseExamesModel>> readUsers() => FirebaseFirestore.instance
      .collection('analisesDeExames')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => AnaliseExamesModel.fromJson(doc.data())).toList());

}


