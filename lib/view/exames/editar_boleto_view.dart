import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../widgets/custom_baliza_counter.dart';
import '../../widgets/custom_baliza_observations.dart';
import '../../widgets/custom_boleto_header.dart';
import '../../widgets/custom_colors.dart';
import '../../widgets/custom_table.dart';
import '../boleto_offline/boleto_offline_teste_view.dart';

class EditarBoleto extends StatefulWidget {
  const EditarBoleto({Key? key}) : super(key: key);

  @override
  State<EditarBoleto> createState() => _EditarBoletoState();
}

class _EditarBoletoState extends State<EditarBoleto> {
  final StopWatchTimer _tempoTotal = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  final StopWatchTimer _tempoBaliza = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  int currentTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _tempoTotal.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String categoria = modalRoute["categoriaExame"].toString();
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();


    _tempoTotal.onExecute.add(StopWatchExecute.start);
    _tempoTotal.onExecute.add(StopWatchExecute.lap);

    String displayTimeHeader = "00:17:43";
    String displayTime = "00:17:43";
    String displayTimeBaliza = "00:04:31";
    String balizaDisplayTime = "";

    String nome = "Cristian Figueiredo";

    final boletoHeader = CustomBoletoHeader(
      localDoExame: localDoExame,
      categoria: categoria,
      nome: nome,
      unidadeDeTransito: unidadeDeTransito,
      dia: dia,
      displayTime: displayTime,
      temporizador: StreamBuilder<int>(
        stream: _tempoTotal.rawTime,
        builder: (context, snap) {
          final value = snap.data;
          displayTime = StopWatchTimer.getDisplayTime(value == null ? 0 : value,
              milliSecond: false);
          return Text(
            displayTimeHeader,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

    final balizaCounter = CustomBalizaCounter(
      balizaDisplayTime: displayTimeBaliza,
      temporaziadorBaliza: StreamBuilder<int>(
        stream: _tempoBaliza.rawTime,
        builder: (context, snap) {
          final value = snap.data;
          balizaDisplayTime = StopWatchTimer.getDisplayTime(
              value == null ? 0 : value,
              milliSecond: false);
          return Text(
            displayTimeBaliza,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      isRunning: _tempoBaliza.isRunning,
      bottomAdd: () {
        setState(() {
          _tempoBaliza.onExecute.add(StopWatchExecute.start);
        });
      },
      bottomStop: () {
        setState(() {
          _tempoBaliza.onExecute.add(StopWatchExecute.stop);
        });
      },
    );



    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Icon(Icons.clear),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      content: const Text(
                        "Tem certeza que deseja solicitar o cancelamento do exame desde candidato?",
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.all(14),
                            width: 110,
                            height: 50,
                            color: Cores.azul,
                            child: const Center(
                              child: Text(
                                "SIM",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.pushReplacementNamed(
                                  context, '/solicitarCancelamento',
                                  arguments: {
                                    "nome": nome,
                                    "localDoExame": localDoExame,
                                    "categoria": categoria,
                                    "unidadeDeTransito": unidadeDeTransito,
                                    "dia": dia,
                                    "displayTime": displayTime
                                  });
                            });
                          },
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(14),
                            width: 110,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Cores.azul,
                                )),
                            child: Center(
                              child: Text(
                                "Cancelar",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Cores.azul,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 375,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(width: 1, color: Cores.vermelhoBotao)),
                child: Center(
                    child: Text(
                      "Solicitar Cancelamento",
                      style: TextStyle(
                          color: Cores.vermelhoBotao, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const SizedBox(
              width: 33,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/confirmarEdicaoExame', arguments: {
                    "nome": nome,
                    "localDoExame": localDoExame,
                    "categoria": categoria,
                    "unidadeDeTransito": unidadeDeTransito,
                    "dia": dia,
                    "displayTime": displayTime
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 375,
                height: 40,
                decoration: BoxDecoration(
                    color: Cores.azul,
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: const Center(
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Boleto",
          style: TextStyle(fontSize: 45),
        ),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        currentIndex: currentTab,
        items: [
          BottomNavigationBarItem(
            label: "Faltas Eliminatórias",
            icon: currentTab == 0
                ? Container(
              child: const Text("Faltas Eliminatórias",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
                : Container(
              child: const Text("Faltas Eliminatórias",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ),
          BottomNavigationBarItem(
            label: "Faltas Leves",
            icon: currentTab == 1
                ? Container(
              child: const Text("Faltas Leves",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
                : Container(
              child: const Text("Faltas Leves",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ),
          BottomNavigationBarItem(
            label: "Faltas Médias",
            icon: currentTab == 2
                ? Container(
              child: const Text("Faltas Médias",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
                : Container(
              child: const Text("Faltas Médias",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ),
          BottomNavigationBarItem(
            label: "Faltas Graves",
            icon: currentTab == 3
                ? Container(
              child: const Text("Faltas Graves",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
                : Container(
              child: const Text("Faltas Graves",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IndexedStack(
          index: currentTab,
          children: <Widget>[
            //Faltas Eliminatória
            Column(
              children: [
                //Parte de cima do Boleto
                boletoHeader,
                //Centro da Tela
                CustomBoletoBody(
                  customTable: CustomTable(
                      headerWidget: [
                        TextTableRow(
                          nome: "I - Faltas Eliminatórias",
                          aligment: Alignment.centerLeft,
                        ),
                      ],
                      bodyWidget: List.generate(
                        faltasEliminatorias.length,
                            (index) => TableRow(children: [
                          BoletoCheckbox(
                            onClick: (bool? value) {
                              setState(() {
                                faltasEliminatorias[index].checkboxState =
                                    value;
                              });
                            },
                            value: faltasEliminatorias[index].checkboxState,
                          ),
                          BoletoItem(
                              itemName: faltasEliminatorias[index].nome!),
                        ]),
                      ),
                      columnWidths: {0: FlexColumnWidth(0.2)}),
                  customBalizaCounter: balizaCounter,
                ),
              ],
            ),
            //Faltas Leves
            Column(
              children: [
                //Parte de cima do Boleto
                boletoHeader,
                //Centro da Tela
                CustomBoletoBody(
                    customTable: CustomTable(
                      headerWidget: [
                        TextTableRow(
                          nome: 'II - Faltas Leves (1 ponto)',
                          aligment: Alignment.centerLeft,
                        ),
                        TextTableRow(nome: 'Quantidade de Faltas')
                      ],
                      bodyWidget: List.generate(
                        faltasLeves.length,
                            (index) => TableRow(
                          children: [
                            BoletoItem(itemName: faltasLeves[index].nome!),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasLeves[index].falta1 = value;
                                });
                              },
                              value: faltasLeves[index].falta1,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasLeves[index].falta2 = value;
                                });
                              },
                              value: faltasLeves[index].falta2,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasLeves[index].falta3 = value;
                                });
                              },
                              value: faltasLeves[index].falta3,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasLeves[index].falta4 = value;
                                });
                              },
                              value: faltasLeves[index].falta4,
                            ),
                          ],
                        ),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.6),
                      },
                      bodyColumnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.15),
                        2: FlexColumnWidth(0.15),
                        3: FlexColumnWidth(0.15),
                        4: FlexColumnWidth(0.15),
                      },
                    ),
                    customBalizaCounter: balizaCounter)
              ],
            ),

            //Faltas Médias
            Column(
              children: [
                //Parte de cima do Boleto
                boletoHeader,
                //Centro da Tela
                CustomBoletoBody(
                    customTable: CustomTable(
                      headerWidget: [
                        TextTableRow(
                          nome: 'III - Faltas Médias (2 pontos)',
                          aligment: Alignment.centerLeft,
                        ),
                        TextTableRow(nome: 'Quantidade de Faltas')
                      ],
                      bodyWidget: List.generate(
                        faltasMedias.length,
                            (index) => TableRow(
                          children: [
                            BoletoItem(
                              itemName: faltasMedias[index].nome!,
                              fontSize: 18,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasMedias[index].falta1 = value;
                                });
                              },
                              value: faltasMedias[index].falta1,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasMedias[index].falta2 = value;
                                });
                              },
                              value: faltasMedias[index].falta2,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasMedias[index].falta3 = value;
                                });
                              },
                              value: faltasMedias[index].falta3,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasMedias[index].falta4 = value;
                                });
                              },
                              value: faltasMedias[index].falta4,
                            ),
                          ],
                        ),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.6),
                      },
                      bodyColumnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.15),
                        2: FlexColumnWidth(0.15),
                        3: FlexColumnWidth(0.15),
                        4: FlexColumnWidth(0.15),
                      },
                    ),
                    customBalizaCounter: balizaCounter)
              ],
            ),

            //Faltas Graves
            Column(
              children: [
                //Parte de cima do Boleto
                boletoHeader,
                //Centro da Tela
                CustomBoletoBody(
                    customTable: CustomTable(
                      headerWidget: [
                        TextTableRow(
                          nome: 'IV - Faltas Graves (3 pontos)',
                          aligment: Alignment.centerLeft,
                        ),
                        TextTableRow(nome: 'Quantidade de Faltas')
                      ],
                      bodyWidget: List.generate(
                        faltasGraves.length,
                            (index) => TableRow(
                          children: [
                            BoletoItem(
                              itemName: faltasGraves[index].nome!,
                              fontSize: 18,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasGraves[index].falta1 = value;
                                });
                              },
                              value: faltasGraves[index].falta1,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasGraves[index].falta2 = value;
                                });
                              },
                              value: faltasGraves[index].falta2,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasGraves[index].falta3 = value;
                                });
                              },
                              value: faltasGraves[index].falta3,
                            ),
                            BoletoCheckbox(
                              onClick: (bool? value) {
                                setState(() {
                                  faltasGraves[index].falta4 = value;
                                });
                              },
                              value: faltasGraves[index].falta4,
                            ),
                          ],
                        ),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.6),
                      },
                      bodyColumnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.15),
                        2: FlexColumnWidth(0.15),
                        3: FlexColumnWidth(0.15),
                        4: FlexColumnWidth(0.15),
                      },
                    ),
                    customBalizaCounter: balizaCounter)
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<FaltasEliminatorias> faltasEliminatorias = [
    FaltasEliminatorias(
        id: 1, checkboxState: false, nome: "Desobedecer à sinalização semafórica e de parada obrigatória"),
    FaltasEliminatorias(id: 2, checkboxState: false, nome: "Avançar sobre o meio-fio"),
    FaltasEliminatorias(
        id: 3,
        checkboxState: false,
        nome: "Não colocar o veículo na área balizada em, no máximo, três tentativas no tempo estabelecido"),
    FaltasEliminatorias(
        id: 4,
        checkboxState: false,
        nome: "Avançar sobre o balizamento demarcado quando do estacionamento do veículo na vaga"),
    FaltasEliminatorias(id: 5, checkboxState: false, nome: "Transitar em contramão de direção"),
    FaltasEliminatorias(
        id: 6, checkboxState: false, nome: "Não completar a realização de todas as etapas do exame"),
    FaltasEliminatorias(id: 7, checkboxState: false, nome: "Avançar a via preferencial"),
    FaltasEliminatorias(id: 8, checkboxState: false, nome: "Provocar acidente durante a realização do exame"),
    FaltasEliminatorias(id: 9, checkboxState: false, nome: "Exceder a velocidade regulamente para a via"),
    FaltasEliminatorias(
        id: 10,
        checkboxState: false,
        nome: "Cometer qualquer outra infração de trânsito de natureza gravíssima"),
  ];

  List<FaltasGerais> faltasLeves = [
    FaltasGerais(
        id: 1,
        nome: "Provocar movimentos irregulares no veículo sem motivo justificado",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 2,
        nome: "Ajustar incorretamente o banco do veículo destinado ao condutor",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 3,
        nome: "Não Ajustar devidamente os espelhos retrovisores",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 4,
        nome: "Apoiar o pé no pedal da embreagem com o veículo engrenado e em movimento",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 5,
        nome: "Utilizar ou interpretar incorretamente os instrumentos do painel do veículo",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 6,
        nome: "Dar partida ao veículo com a engrenagem de tração ligada",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 7,
        nome: "Tentar movimentar o veículo com a engrenagem de tração em ponto neutro",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 8,
        nome: "Cometer qualquer outra inflação de natureza leve",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
  ];

  List<FaltasGerais> faltasMedias = [
    FaltasGerais(
        id: 1,
        nome:
            "Executar o percurso da prova, no todo, ou parte dele sem estar com o freio de mão inteiramente livre",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 2,
        nome:
            "Trafegar em velocidade inadequada para as condições adversas do local, da circulação, do veículo ou do clima",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 3,
        nome: "Interromper o funcionamento do motor, sem justa razão, após o início do exame",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 4,
        nome: "Fazer a conversão incorretamente",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 5,
        nome: "Usar a busina sem necessidade ou em local proibido",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 6,
        nome: "Desengrenar o veículo nos declives",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 7,
        nome: "Colocar o veículo em movimento, sem observar as cautelas necessárias",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 8,
        nome: "Usar o pedal de embreagem, antes de usar o pedal de freio nas frenagens",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 9,
        nome: "Entrar nas curvas com a engrenagem de tração do veículo em ponto neutro",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 10,
        nome: "Engrenar ou utilizar marchas de maneira incorreta durante o percurso",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 11,
        nome: "Cometer qualquer outra infração de trânsito de natureza média",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
  ];

  List<FaltasGerais> faltasGraves = [
    FaltasGerais(
        id: 1,
        nome: "Desobedecer à sinalização da via ou ao agente da autoridade de trânsito",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 2,
        nome: "Não observar as regras de ultrapassagem ou de mudança de direção",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 3,
        nome:
            "Não dar preferência de passagem ao pedestre que estiver atravessando a via transversal mesmo que ocorra sinal verde para o veículo",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 4,
        nome: "Manter a porta do veículo aberta ou semiaberta durante o percurso do exame ou parte dele",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 5,
        nome: "Não sinalizar com antecedência a manobra pretendida ou sinalizâ-la incorretamente",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 6,
        nome: "Não usar devidamente o cinto de segurança",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 7,
        nome: "Perder o controle da direção do veículo em movimento",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 8,
        nome: "Cometer qualquer outra infração de trânsito de natureza grave",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: false),
  ];
}
/*
*
* */

class FaltasEliminatorias {
  int? id;
  String? nome;
  bool? checkboxState;

  FaltasEliminatorias({
    this.id,
    this.nome,
    this.checkboxState,
  });
}

class FaltasGerais {
  int? id;
  String? nome;
  int? qntFaltas;
  bool? falta1;
  bool? falta2;
  bool? falta3;
  bool? falta4;

  FaltasGerais({
    this.id,
    this.nome,
    this.qntFaltas,
    this.falta1,
    this.falta2,
    this.falta3,
    this.falta4,
  });
}
