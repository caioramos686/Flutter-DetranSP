import 'package:boleto_digital/widgets/custom_baliza_counter.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'custom_table.dart';

class CustomBoletoBody extends StatelessWidget {
  CustomBoletoBody(
      {Key? key, required this.customTable, required this.customBalizaCounter, this.saveButton, this.onChanged})
      : super(key: key);

  CustomTable customTable;
  CustomBalizaCounter customBalizaCounter;
  void Function()? saveButton;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    width: 375,
                    child: TextField(
                      onChanged: onChanged,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.attach_file),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: saveButton,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 375,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Cores.azul,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: const Center(
                          child: Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 130,
              ),
              customBalizaCounter,
            ],
          ),
        ),

        //Tabelas de faltas
        customTable,
      ],
    );
  }
}
