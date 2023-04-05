import 'package:boleto_digital/widgets/custom_button_full.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class IntercorrenciaBanca extends StatefulWidget {
  const IntercorrenciaBanca({Key? key}) : super(key: key);

  @override
  State<IntercorrenciaBanca> createState() => _IntercorrenciaBancaState();
}

class _IntercorrenciaBancaState extends State<IntercorrenciaBanca> {
  TextEditingController intercorrenciaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String categoriaExame = modalRoute["categoriaExame"].toString();

    return CustomScaffold(
      textAppBar: 'Exames',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Intercorrencias da banca",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Presidente Teste um: ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Data: ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  dia,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Unidade de Trânsito: ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  unidadeDeTransito,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Local do Exame: ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  localDoExame,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Categoria: ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  categoriaExame,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchField(
              icon: Icons.attach_file,
              name: 'Descreva a intercorrencia aqui!',
              controller: intercorrenciaController,
              onClick: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButtonFull(
              name: 'Adicionar',
              onClick: () {
                Navigator.pushNamed(context, '/assinaturaIntercorrencia');
              }),
        ],
      ),
    );
  }
}
