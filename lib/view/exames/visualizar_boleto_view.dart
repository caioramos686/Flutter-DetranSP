import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../widgets/custom_colors.dart';

class VisualizarBoletoView extends StatefulWidget {
  const VisualizarBoletoView({Key? key}) : super(key: key);

  @override
  State<VisualizarBoletoView> createState() => _VisualizarBoletoViewState();
}

class _VisualizarBoletoViewState extends State<VisualizarBoletoView> {
  final StopWatchTimer _tempoTotal = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  final StopWatchTimer _tempoBaliza = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  int current_tab = 0;

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
    _tempoTotal.onExecute.add(StopWatchExecute.start);
    _tempoTotal.onExecute.add(StopWatchExecute.lap);
    String displayTime = "00:17:43";
    String displayTimeBaliza = "00:04:31";

    String dia = "01/06/2022";
    String localDoExame = "São-Paulo";
    String categoria = "B";
    String unidadeDeTransito = "CIR-Araúja";
    String nome = "Cristian Figueiredo";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 270,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(width: 1, color: Cores.vermelho)),
              child: Center(
                  child: Text(
                "Solicitar Cancelamento",
                style: TextStyle(color: Cores.vermelho, fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 470,
              height: 40,
              decoration: BoxDecoration(
                  color: Cores.azulBorrado, borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: const Center(
                  child: Text(
                "Salvar",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
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
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            current_tab = index;
          });
        },
        currentIndex: current_tab,
        items: const [
          BottomNavigationBarItem(label: "Faltas Eliminatorias", icon: Icon(Icons.error)),
          BottomNavigationBarItem(label: "Faltas Leves", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "Faltas Médias", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "Faltas Graves", icon: Icon(Icons.abc)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IndexedStack(
          index: current_tab,
          children: <Widget>[
            //Faltas Eliminatória
            Column(children: [
              //Parte de cima do Boleto
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Exame Prático",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text("REPROVADO", style: TextStyle(fontSize: 30, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold)),
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
                      const Spacer(),
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

              //Centro da Tela
              Column(
                children: [
                  Column(
                    children: [
                      //Parte Baliza e Observações
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text("Adicionar observações:"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 400,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Cores.azulBorrado,
                                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                                  child: const Center(
                                      child: Text(
                                    "Salvar",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Contador da Baliza:",
                                  style: TextStyle(
                                      color: Cores.vermelhoBotao, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 6),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.5)
                                        ),
                                        child: Center(
                                          child: Text(
                                            displayTimeBaliza,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 40,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: Cores.azul,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("VER PERCURSO DO EXAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      //Tabelas de faltas
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Container(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Faltas Eliminatorias",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                )),
                          ])
                        ],
                      ),
                      Table(
                        columnWidths: const {0: FlexColumnWidth(0.2)},
                        border: TableBorder.all(),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: List.generate(
                          faltasEliminatorias.length,
                          (index) => TableRow(children: [
                            Checkbox(
                              value: faltasEliminatorias[index].checkboxState,
                              onChanged: null,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                faltasEliminatorias[index].nome!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),

            //Faltas Leves
            Column(children: [
              //Parte de cima do Boleto
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Exame Prático",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text("REPROVADO", style: TextStyle(fontSize: 30, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold)),
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
                      const Spacer(),
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

              //Centro da Tela
              Column(
                children: [
                  Column(
                    children: [
                      //Parte Baliza e Observações
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text("Adicionar observações:"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 400,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Cores.azulBorrado,
                                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                                  child: const Center(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Contador da Baliza:",
                                  style: TextStyle(
                                      color: Cores.vermelhoBotao, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 6),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 0.5)
                                        ),
                                        child: Center(
                                          child: Text(
                                            displayTimeBaliza,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 40,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: Cores.azul,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("VER PERCURSO DO EXAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      //Tabelas de faltas
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.6),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                child: const Text(
                                  "Faltas Leves (1 ponto)",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Quantidade de Faltas",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.15),
                          2: FlexColumnWidth(0.15),
                          3: FlexColumnWidth(0.15),
                          4: FlexColumnWidth(0.15),
                        },
                        border: TableBorder.all(),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: List.generate(
                          faltasLeves.length,
                          (index) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                faltasLeves[index].nome!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Checkbox(
                              value: faltasLeves[index].falta1,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasLeves[index].falta2,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasLeves[index].falta3,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasLeves[index].falta4,
                              onChanged: null,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),

            //Faltas Médias
            Column(children: [
              //Parte de cima do Boleto
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Exame Prático",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text("REPROVADO", style: TextStyle(fontSize: 30, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold)),
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
                      const Spacer(),
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

              //Centro da Tela
              Column(
                children: [
                  Column(
                    children: [
                      //Parte Baliza e Observações
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text("Adicionar observações:"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 400,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Cores.azulBorrado,
                                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                                  child: const Center(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Contador da Baliza:",
                                  style: TextStyle(
                                      color: Cores.vermelhoBotao, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 6),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 0.5)
                                        ),
                                        child: Center(
                                          child: Text(
                                            displayTimeBaliza,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 40,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: Cores.azul,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("VER PERCURSO DO EXAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      //Tabelas de faltas
                      Column(
                        children: [
                          Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(0.6),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    child: const Text(
                                      "Faltas Médias (2 pontos)",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Quantidade de Faltas",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(0.15),
                              2: FlexColumnWidth(0.15),
                              3: FlexColumnWidth(0.15),
                              4: FlexColumnWidth(0.15),
                            },
                            border: TableBorder.all(),
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children: List.generate(
                              faltasMedias.length,
                              (index) => TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    faltasMedias[index].nome!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                Checkbox(
                                  value: faltasMedias[index].falta1,
                                  onChanged: null,
                                ),
                                Checkbox(
                                  value: faltasMedias[index].falta2,
                                  onChanged: null,
                                ),
                                Checkbox(
                                  value: faltasMedias[index].falta3,
                                  onChanged: null,
                                ),
                                Checkbox(
                                  value: faltasMedias[index].falta4,
                                  onChanged: null,
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]),

            //Faltas Graves
            Column(children: [
              //Parte de cima do Boleto
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Exame Prático",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text("REPROVADO", style: TextStyle(fontSize: 30, color: Cores.vermelhoBotao, fontWeight: FontWeight.bold)),
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
                      const Spacer(),
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

              //Centro da Tela
              Column(
                children: [
                  Column(
                    children: [
                      //Parte Baliza e Observações
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text("Adicionar observações:"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 400,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Cores.azulBorrado,
                                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                                  child: const Center(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Contador da Baliza:",
                                  style: TextStyle(
                                      color: Cores.vermelhoBotao, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 6),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 0.5)
                                        ),
                                        child: Center(
                                          child: Text(
                                            displayTimeBaliza,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 40,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: Cores.azul,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("VER PERCURSO DO EXAME", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      //Tabelas de faltas
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.6),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                child: const Text(
                                  "Faltas Graves (3 pontos)",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Quantidade de Faltas",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.15),
                          2: FlexColumnWidth(0.15),
                          3: FlexColumnWidth(0.15),
                          4: FlexColumnWidth(0.15),
                        },
                        border: TableBorder.all(),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: List.generate(
                          faltasGraves.length,
                          (index) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                faltasGraves[index].nome!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Checkbox(
                              value: faltasGraves[index].falta1,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasGraves[index].falta2,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasGraves[index].falta3,
                              onChanged: null,
                            ),
                            Checkbox(
                              value: faltasGraves[index].falta4,
                              onChanged: null,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
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
    FaltasEliminatorias(id: 5, checkboxState: true, nome: "Transitar em contramão de direção"),
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
        falta1: true,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 2,
        nome: "Ajustar incorretamente o banco do veículo destinado ao condutor",
        falta1: true,
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
        falta1: true,
        falta2: true,
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
        falta1: true,
        falta2: true,
        falta3: true,
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
        falta1: true,
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
        falta1: true,
        falta2: true,
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
        falta1: true,
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
        falta1: true,
        falta2: false,
        falta3: false,
        falta4: false),
  ];

  List<FaltasGerais> faltasGraves = [
    FaltasGerais(
        id: 1,
        nome: "Desobedecer à sinalização da via ou ao agente da autoridade de trânsito",
        falta1: false,
        falta2: true,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 2,
        nome: "Não observar as regras de ultrapassagem ou de mudança de direção",
        falta1: false,
        falta2: false,
        falta3: true,
        falta4: false),
    FaltasGerais(
        id: 3,
        nome:
            "Não dar preferência de passagem ao pedestre que estiver atravessando a via transversal mesmo que ocorra sinal verde para o veículo",
        falta1: true,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 4,
        nome: "Manter a porta do veículo aberta ou semiaberta durante o percurso do exame ou parte dele",
        falta1: false,
        falta2: false,
        falta3: false,
        falta4: true),
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
        falta1: true,
        falta2: false,
        falta3: true,
        falta4: false),
    FaltasGerais(
        id: 7,
        nome: "Perder o controle da direção do veículo em movimento",
        falta1: true,
        falta2: false,
        falta3: false,
        falta4: false),
    FaltasGerais(
        id: 8,
        nome: "Cometer qualquer outra infração de trânsito de natureza grave",
        falta1: true,
        falta2: true,
        falta3: true,
        falta4: true),
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
