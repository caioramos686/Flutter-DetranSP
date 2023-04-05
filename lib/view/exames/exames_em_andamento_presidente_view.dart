import 'dart:convert';
import 'package:boleto_digital/widgets/custom_button_Quarter.dart';
import 'package:boleto_digital/widgets/custom_button_half.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_search_field.dart';
import 'package:boleto_digital/widgets/custom_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/exames/exames_em_andamento_model.dart';
import '../../widgets/custom_colors.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_progress_circle.dart';

class ExamesEmAndamento extends StatefulWidget {
  const ExamesEmAndamento({
    Key? key,
  }) : super(key: key);

  @override
  State<ExamesEmAndamento> createState() => _ExamesEmAndamentoState();
}

class _ExamesEmAndamentoState extends State<ExamesEmAndamento> {
  String examinador = "";
  String candidato = "";
  int id = 0;
  String categoria = "";
  String resultado = "";
  bool state = false;

  EdgeInsetsGeometry tablePadding = const EdgeInsets.fromLTRB(12, 16, 12, 16);

  int idFor = 0;

  final TextEditingController CPFController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readExames();
  }

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String categoriaExame = modalRoute["categoriaExame"].toString();

    List<ExamesAndamentoModel> listaDeExames = [];

    Map<String, dynamic> arguments = {
      "dia": dia,
      "unidadeDeTransito": unidadeDeTransito,
      "localDoExame": localDoExame,
      "categoriaExame": categoriaExame,
      "candidato": candidato,
    };

    return CustomScaffold(
        textAppBar: "Exames",
        body: Column(
          children: [
            const Text(
              "Exames em andamento",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              child: CustomSearchField(
                  name: "Busque por CPF, e/ou CFC e ou horário do exame",
                  controller: CPFController,
                  onClick: () {}),
            ),
            SizedBox(
              height: 750,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    StreamBuilder<List<ExamesAndamentoModel>>(
                      stream: readExames(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const ErroTempoLimiteApi(
                            nome: 'Exames Concluidos',
                          );
                        } else if (snapshot.hasData) {
                          listaDeExames = snapshot.data!;

                          return Column(
                            children: [
                              CustomTable(
                                headerWidget: [
                                  TextTableRow(
                                    nome: "",
                                  ),
                                  TextTableRow(
                                    nome: "Examinador",
                                  ),
                                  TextTableRow(
                                    nome: "Candidato",
                                  ),
                                  TextTableRow(
                                    nome: "Categoria",
                                  ),
                                  TextTableRow(
                                    nome: "Resultado",
                                  ),
                                ],
                                bodyWidget: List.generate(listaDeExames.length, (index) {
                                  return TableRow(
                                    children: [
                                      BoletoCheckbox(
                                        value: listaDeExames[index].estadoBoolean,
                                        onClick: (bool? value)  {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection('examesAndamento')
                                                .doc('${index + 1}')
                                                .update({'estadoBoolean': !listaDeExames[index].estadoBoolean});
                                          });
                                          setState(() {
                                            categoria = listaDeExames[index].categoria;
                                            examinador = listaDeExames[index].examinador;
                                            candidato = listaDeExames[index].candidato;
                                            resultado = listaDeExames[index].resultado;
                                          });
                                        },
                                      ),
                                      TextTableRow(
                                        nome: listaDeExames[index].examinador,
                                        padding: tablePadding,
                                      ),
                                      TextTableRow(
                                        nome: listaDeExames[index].candidato,
                                        padding: tablePadding,
                                      ),
                                      TextTableRow(
                                        nome: listaDeExames[index].categoria,
                                        padding: tablePadding,
                                      ),
                                      TextTableRow(
                                        nome: listaDeExames[index].resultado,
                                        padding: tablePadding,
                                      ),
                                    ],
                                  );
                                }),
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(3),
                                  3: FlexColumnWidth(3),
                                  4: FlexColumnWidth(3),
                                },
                              ),
                            ],
                          );
                        } else {
                          return CirculoDeProgresso();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  const Spacer(),
                  CustomButtonHalf(
                      name: "FINALIZAR BANCA",
                      colors: Cores.vermelhoBotao,
                      onClick: () {
                        Navigator.pushNamed(context, '/assinaturaPresidente');
                      }),
                  const Spacer(),
                  CustomButtonHalf(
                      name: "DESCREVER INTERCORRÊNCIAS",
                      colors: Cores.vermelhoBotao,
                      onClick: () {
                        Navigator.pushNamed(context, '/intercorrenciaBanca', arguments: arguments);
                      }),
                  const Spacer(),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                CustomButtonQuarter(
                    name: "REPROVAR",
                    colors: Cores.azul,
                    onClick: () async {
                      setState((){
                        if(candidato == ""){
                          listaDeExames.forEach((element) {
                            if(element.estadoBoolean == true){
                              candidato = element.candidato;
                            }
                          });
                        }
                      });
                      await Navigator.pushNamed(context, '/reprovarExame', arguments: arguments);
                    }),
                const Spacer(),
                CustomButtonQuarter(
                    name: "CANCELAR",
                    colors: Cores.azul,
                    onClick: () {
                      Navigator.pushNamed(context, '/cancelarExame', arguments: arguments);
                    }),
                const Spacer(),
                CustomButtonQuarter(
                    name: "VISUALIZAR",
                    onClick: () {
                      setState(() {
                        Navigator.pushNamed(context, '/visualizarboleto');
                      });
                    }),
                const Spacer(),
                CustomButtonQuarter(
                    name: "EDITAR",
                    onClick: () {
                      setState(() {
                        Navigator.pushNamed(context, '/editarBoleto', arguments: arguments);
                      });
                    }),
                const Spacer(),
                CustomButtonQuarter(
                    name: "APROVAR",
                    onClick: () {
                      setState(() {
                        Navigator.pushNamed(context, "/confirmarValidacaoExame", arguments: arguments);
                      });
                    }),
                const Spacer(),
              ],
            )
          ],
        ));
  }

  Future<InfoExameModel> getID(int id) async {
    String url = "https://1e53d074-a45c-4000-94d3-e0e2bc713b3c.mock.pstmn.io/examesEmAndamento?id=$id";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    print(responseData);
    InfoExameModel infoExames = InfoExameModel(
        data: responseData["data"],
        unidade: responseData["unidade"],
        localexame: responseData["localexame"],
        categoria: responseData["categoria"]);
    return infoExames;
  }

  Stream<List<ExamesAndamentoModel>> readExames() {
    final firebase = FirebaseFirestore.instance
        .collection('examesAndamento')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => ExamesAndamentoModel.fromJson(doc.data())).toList());

    return firebase;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> futureFetchAll(){
    final firebase = FirebaseFirestore.instance.collection('examesAndamento').get();
    return firebase;
  }
}

class InfoExameModel {
  String? data;
  String? unidade;
  String? localexame;
  String? categoria;

  InfoExameModel({
    this.data,
    this.unidade,
    this.localexame,
    this.categoria,
  });
}

class VisualizarBoletoModel {
  int? id;
  String? cpf;
  String? tempoTotal;
  String? tempoBaliza;
  String? resultado;
  String? examinador;
  String? data;
  String? unidadeTransito;
  String? localDoExame;
  String? protocolo;
  String? candidato;
  String? categoria;
  String? autoEscola;
  List? faltasEliminatorias;
  List? faltasGraves;
  List? faltasMedias;
  List? faltasLeves;

  VisualizarBoletoModel(
      {this.id,
      this.resultado,
      this.cpf,
      this.tempoTotal,
      this.tempoBaliza,
      this.examinador,
      this.data,
      this.unidadeTransito,
      this.localDoExame,
      this.protocolo,
      this.candidato,
      this.categoria,
      this.autoEscola,
      this.faltasEliminatorias,
      this.faltasGraves,
      this.faltasMedias,
      this.faltasLeves});

  VisualizarBoletoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tempoBaliza = json['TempoBaliza'];
    tempoTotal = json['tempoTotal'];
    cpf = json['cpf'];
    resultado = json['resultado'];
    examinador = json['examinador'];
    data = json['data'];
    unidadeTransito = json['unidadeTransito'];
    localDoExame = json['localDoExame'];
    protocolo = json['protocolo'];
    candidato = json['candidato'];
    categoria = json['categoria'];
    autoEscola = json['autoEscola'];
    faltasEliminatorias = json['faltasEliminatorias'];
    faltasGraves = json['faltasGraves'];
    faltasMedias = json['faltasMedias'];
    faltasLeves = json['faltasLeves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tempoBaliza'] = this.tempoBaliza;
    data['tempoTotal'] = this.tempoTotal;
    data['cpf'] = this.cpf;
    data['id'] = this.id;
    data['resultado'] = this.resultado;
    data['examinador'] = this.examinador;
    data['data'] = this.data;
    data['unidadeTransito'] = this.unidadeTransito;
    data['localDoExame'] = this.localDoExame;
    data['protocolo'] = this.protocolo;
    data['candidato'] = this.candidato;
    data['categoria'] = this.categoria;
    data['autoEscola'] = this.autoEscola;
    data['faltasEliminatorias'] = this.faltasEliminatorias;
    data['faltasGraves'] = this.faltasGraves;
    data['faltasMedias'] = this.faltasMedias;
    data['faltasLeves'] = this.faltasLeves;
    return data;
  }
}

Future<VisualizarBoletoModel> getBoleto() async {
  String url = "https://6a0d98e5-3351-40a5-9847-8a0ade1edd91.mock.pstmn.io/visualizarboleto";
  final response = await http.get(
    Uri.parse(url),
  );

  var responseData = json.decode(response.body);
  print(responseData);
  VisualizarBoletoModel boletoModel = VisualizarBoletoModel(
    id: responseData['id'],
    cpf: responseData['cpf'],
    tempoTotal: responseData['tempoTotal'],
    tempoBaliza: responseData['tempoBaliza'],
    resultado: responseData['resultado'],
    examinador: responseData['examinador'],
    data: responseData['data'],
    unidadeTransito: responseData['unidadeTransito'],
    localDoExame: responseData['localDoExame'],
    protocolo: responseData['protocolo'],
    candidato: responseData['candidato'],
    categoria: responseData['categoria'],
    autoEscola: responseData['autoEscola'],
    faltasEliminatorias: responseData['faltasEliminatorias'],
    faltasGraves: responseData['faltasGraves'],
    faltasMedias: responseData['faltasMedias'],
    faltasLeves: responseData['faltasLeves'],
  );
  return boletoModel;
}

//Add User
/*
                      final docUser = FirebaseFirestore.instance.collection('examesAndamento').doc('5');
                      final user = ExamesAndamentoModel(
                        examinador: 'Examinador 5',
                        candidato: 'Candidato 5',
                        categoria: 'E',
                        resultado: 'Aprovado',
                        estadoBoolean: false,
                      );
                      final json = user.toJson();
                      await docUser.set(json);
                       */

//For checkbox
/*
                                          setState(() {
                                            for (int i = 0; i < listaDeExames.length; i++) {
                                              listaDeExames[i].estadoBoolean = false;
                                              FirebaseFirestore.instance
                                                  .collection('examesAndamento')
                                                  .doc('${i + 1}')
                                                  .update({'estadoBoolean': listaDeExames[i].estadoBoolean});
                                            }
                                          });
                                          listaDeExames[index].estadoBoolean = true;
                                           */
