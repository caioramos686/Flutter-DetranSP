import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_button_half.dart';
import 'package:boleto_digital/widgets/custom_dropdownbutton.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_text_input_with_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class CancelarExame extends StatefulWidget {
  const CancelarExame({Key? key}) : super(key: key);

  @override
  State<CancelarExame> createState() => _CancelarExameState();
}

class _CancelarExameState extends State<CancelarExame> {
  TextEditingController cancelarExameController = TextEditingController();
  String nome = "Daniel Cariatte";

  String select = "Selecione o motivo do cancelamento";

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String categoriaExame = modalRoute["categoriaExame"].toString();
    String candidato = modalRoute["candidato"].toString();

    return CustomScaffold(
      textAppBar: 'Exames',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Cancelar exame de candidato ausente",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Cores.azul),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Banca especial",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Cores.azul),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Data: ",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dia,
                      style: TextStyle(fontSize: 30),
                    ),
                    Spacer(),
                    Text(
                      "Presidente teste um",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Unidade de trânsito: ",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(unidadeDeTransito, style: TextStyle(fontSize: 30)),
                    Spacer(),
                    Text(
                      candidato,
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Local do exame: ",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(localDoExame, style: TextStyle(fontSize: 26)),
                    Spacer(),
                    Text(
                      "Categoria: ",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      categoriaExame,
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informe o motivo do cancelamento",
                      style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CustomDropDownButton(
                      hintText: 'Escolha o motivo do cancelamento',
                      valor: ["Candidato Ausente", "Candidato não concluiu a prova"],
                      functionOnChanged: (value) {
                        setState(() {});
                      },
                      functionValidator: (item) {
                        if (item == "Selecione") {
                          return "Escolha uma das opções.";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextInputWithText(
                        controller: cancelarExameController,
                        textoValidacao: 'Por favor, Adicionar alguma observação',
                        keyboardType: TextInputType.visiblePassword,
                        nomeDoCampo: 'Adicionar Observações',
                        onEditingComplete: () {},
                        onChanged: (value) {})
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonHalf(
                      name: 'Adicionar',
                      onClick: () {},
                      tamanhoBorda: 8,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Para confirmar o cancelamento do exame é necessário realizar a assinatura digital",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonFull(
                      tamanhoBorda: 8,
                      name: 'AVANÇAR',
                      onClick: () {
                        Navigator.pushNamed(context, "/assinaturaCancelarExame");
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
