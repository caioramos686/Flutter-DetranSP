import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_text_input.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_colors.dart';
import 'package:intl/intl.dart';

class BoletoOffline extends StatefulWidget {
  const BoletoOffline({Key? key}) : super(key: key);

  @override
  State<BoletoOffline> createState() => _BoletoOfflineState();
}

class _BoletoOfflineState extends State<BoletoOffline> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();


  final formatter = DateFormat('dd/MM/yyyy');


  @override
  Widget build(BuildContext context) {

    String dataFormatada = formatter.format(DateTime.now());

    return CustomScaffold(
      textAppBar: 'Detran.SP',
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EXAME PRÁTICO OFFLINE",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text("Data: $dataFormatada", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Informar os dados do candidato",
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 30),
                    child: CustomTextInput(
                      onChanged: (value) {
                        setState(() {
                          cpfController.value = cpfController.value.copyWith(
                              text: value,
                              selection: TextSelection(baseOffset: value.length, extentOffset: value.length),
                              composing: TextRange.empty);
                        });
                      },
                      controller: cpfController,
                      dicaCampo: "o CPF",
                      keyboardType: TextInputType.number,
                      inputKeyboardType: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      width: 360,
                      height: 50,
                      nomeDoCampo: 'CPF:',
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Informar os dados do veículo",
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: 26,
                        ),
                        child: CustomTextInput(
                          width: 360,
                            height: 50,
                            controller: placaController,
                            dicaCampo: "a placa do veiculo do CFC",
                            keyboardType: TextInputType.visiblePassword,
                            nomeDoCampo: 'PLACA:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: 26,
                        ),
                        child: CustomTextInput(
                          width: 360,
                          height: 50,
                          inputKeyboardType: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          controller: marcaController,
                          dicaCampo: "a marca do veículo do CFC",
                          keyboardType: TextInputType.visiblePassword,
                          nomeDoCampo: 'MARCA:',
                          onChanged: (value) {
                            setState(() {
                              marcaController.value = marcaController.value.copyWith(
                                  text: value,
                                  selection: TextSelection(
                                      baseOffset: value.length, extentOffset: value.length),
                                  composing: TextRange.empty);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                      top: 20,
                    ),
                    child: CustomTextInput(
                      width: 360,
                        height: 50,
                        inputKeyboardType: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        onChanged: (value) {
                          setState(() {
                            modeloController.value = modeloController.value.copyWith(
                                text: value,
                                selection: TextSelection(baseOffset: value.length, extentOffset: value.length),
                                composing: TextRange.empty);
                          });
                        },
                        controller: modeloController,
                        dicaCampo: 'o modelo do veículo do CFC.',
                        keyboardType: TextInputType.visiblePassword,
                        nomeDoCampo: 'MODELO:'),
                  ),

                  cpfController.text.isEmpty == true
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(6))),
                              child: const Center(
                                  child: Text(
                                "Iniciar Exame",
                                style:
                                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                              )),
                            ),
                          ),
                        )
                      : placaController.text.isEmpty == true
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(6))),
                                  child: const Center(
                                      child: Text(
                                    "Iniciar Exame",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                  )),
                                ),
                              ),
                            )
                          : marcaController.text.isEmpty == true
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      width: double.infinity,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(6))),
                                      child: const Center(
                                          child: Text(
                                        "Iniciar Exame",
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                      )),
                                    ),
                                  ),
                                )
                              : modeloController.text.isEmpty == true
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(Radius.circular(6))),
                                          child: const Center(
                                              child: Text(
                                            "Iniciar Exame",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          )),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, '/boletoOfflineView');
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Cores.azul,
                                              borderRadius: BorderRadius.all(Radius.circular(6))),
                                          child: const Center(
                                              child: Text(
                                            "Iniciar Exame",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          )),
                                        ),
                                      ),
                                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
