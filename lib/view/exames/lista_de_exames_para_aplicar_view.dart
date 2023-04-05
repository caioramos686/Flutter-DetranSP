import 'package:boleto_digital/widgets/custom_error_api_fetch.dart';
import 'package:boleto_digital/widgets/custom_navigation_button.dart';
import 'package:boleto_digital/widgets/custom_progress_circle.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/model/exames/lista_de_exames_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EscolherExame extends StatefulWidget {
  const EscolherExame({Key? key}) : super(key: key);

  @override
  State<EscolherExame> createState() => _EscolherExameState();
}

class _EscolherExameState extends State<EscolherExame> {
  String dia = "";
  String unidadeDeTransito = "";
  String localDoExame = "";
  String categoria = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Exames",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Escolha o exame:",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            height: 710,
            child: StreamBuilder<List<ExamesModel>>(
              stream: readExames(),
              builder: (context, snapshot) {
                if (snapshot.hasError){
                  return const ErroTempoLimiteApi();
                } else if(snapshot.hasData){
                  final listaDeExame = snapshot.data!;
                  return ListView.builder(
                    itemCount: listaDeExame.length,
                    itemBuilder: (context, index) {
                      return CustomNavigationButton(
                        name:
                        "Exame do Dia ${listaDeExame[index].dia}, Unidade de Trânsito ${listaDeExame[index].unidadeDeTransito},",
                        onClick: () {
                          dia = listaDeExame[index].dia;
                          localDoExame = listaDeExame[index].localDoExame;
                          unidadeDeTransito = listaDeExame[index].unidadeDeTransito;
                          categoria = listaDeExame[index].categoria;
                          Navigator.pushNamed(context, "/buscaCandidatoExame", arguments: {
                            "dia": dia,
                            "localDoExame": localDoExame,
                            "unidadeDeTransito": unidadeDeTransito,
                            "categoria": categoria
                          });
                        },
                        subtitle: "Local do Exame: ${listaDeExame[index].localDoExame}",
                      );
                    },
                  );
                } else {
                  return CirculoDeProgresso();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Stream<List<ExamesModel>> readExames() => FirebaseFirestore.instance
      .collection('exames').orderBy("localDoExame")
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => ExamesModel.fromJson(doc.data())).toList());

}

/*

"Exame do Dia ${exames[index].dia}, Unidade de Trânsito ${exames[index].unidadeDeTransito},"
"Local do Exame: ${exames[index].localDoExame}"

() {
                    dia = exames[index].dia;
                    localDoExame = exames[index].localDoExame;
                    unidadeDeTransito = exames[index].unidadeDeTransito;
                    categoria = exames[index].categoria;
                    Navigator.pushNamed(context, "/buscaCandidatoExame", arguments: {
                      "dia": dia,
                      "localDoExame": localDoExame,
                      "unidadeDeTransito": unidadeDeTransito,
                      "categoria": categoria
                    });
                  },

*InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/buscaCandidatoExame");
              },
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(width: 1))
                ),
                child: Center(
                  child: ListView.builder(itemCount: exames.length ,itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: ListTile(
                        title: Text("Exame do Dia ${exames[index].dia}, Unidade de Trânsito ${exames[index].unidadeDeTransito},", style: TextStyle(fontSize: 21, color: Colors.black),),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text("Local do Exame: ${exames[index].localDoExame}", style: TextStyle(fontSize: 21, color: Colors.black),),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  }),
                ),
              ),
            ),
*
* */
