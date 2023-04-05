import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class SolicitarCancelamentoBoleto extends StatefulWidget {
  const SolicitarCancelamentoBoleto({Key? key}) : super(key: key);

  @override
  State<SolicitarCancelamentoBoleto> createState() => _SolicitarCancelamentoBoletoState();
}

class _SolicitarCancelamentoBoletoState extends State<SolicitarCancelamentoBoleto> {
  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String nome = modalRoute["nome"].toString();
    String categoria = modalRoute["categoria"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String dia = modalRoute["dia"].toString();
    String displayTime = modalRoute["displayTime"].toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
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
                      categoria,
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
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Para solicitar o cancelamento do exame por favor informar o motivo no campo a seguir",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    decoration:
                        InputDecoration(suffixIcon: Icon(Icons.attach_file), border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 470,
                height: 40,
                decoration: BoxDecoration(
                    color: Cores.azul, borderRadius: BorderRadius.all(const Radius.circular(6))),
                child: const Center(
                    child: Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(width: 1, color: Cores.vermelhoBotao)),
                child: Center(
                    child: Text(
                  "SALVAR SOLICITAÇÃO DE CANCELAMENTO",
                  style: TextStyle(color: Cores.vermelhoBotao, fontWeight: FontWeight.bold),
                )),
              ),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/cancelamentoConfirmadoBoleto');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
