import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class ConfirmarEdicaoExame extends StatefulWidget {
  const ConfirmarEdicaoExame({Key? key}) : super(key: key);

  @override
  State<ConfirmarEdicaoExame> createState() => _ConfirmarEdicaoExameState();
}

class _ConfirmarEdicaoExameState extends State<ConfirmarEdicaoExame> {
  @override
  Widget build(BuildContext context) {

    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String dia = modalRoute["dia"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String categoria = modalRoute["categoria"].toString();


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exames",
          style: TextStyle(fontSize: 45),
        ),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          );
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Confirmação de edição do exame", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Nome: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text("Presidente teste 1", style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("CPF: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text("111.001.001-01", style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Categoria: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text(categoria, style: const TextStyle(fontSize: 30),),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Data: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text(dia, style: const TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Unidade de Trânsito: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text(unidadeDeTransito, style: const TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Local do Exame: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text(localDoExame, style: const TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Categoria: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Text(categoria, style: const TextStyle(fontSize: 30),),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 10),
              child: Text("Para confirmar a edição do exame é necessário realizar a assinatura digital", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 40,),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, "/assinaturaEdicaoBoleto");
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Cores.azul, borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: const Center(
                  child: Text(
                    "AVANÇAR",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
