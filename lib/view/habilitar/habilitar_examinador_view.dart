import 'package:boleto_digital/model/habilitar/examinador_model.dart';
import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_text_title.dart';
import 'package:boleto_digital/widgets/custom_progress_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/habilitar/argumentos_examinador_model.dart';
import '../../view-model/habilitar/habilitar_examinador_view-model.dart';
import '../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_url_mock.dart';

class HabilitarExaminador extends StatelessWidget {
  const HabilitarExaminador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Habilitar examinador",
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: readExaminador(),
                builder: (context, snapshot) {
                  if (snapshot.hasError ) {
                    return const ErroTempoLimiteApi();
                  }
                  else if (snapshot.hasData) {
                    final listaDeExaminador = snapshot.data!.docs;
                    return Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).devicePixelRatio * 750,
                            child: Column(
                              children: [
                                const CustomTextTitle(
                                    textTitle: "Escolha o exame prático que deseja"),
                                SizedBox(
                                  width: MediaQuery.of(context).devicePixelRatio * 500,
                                  child: const CustomTextTitle(
                                      textTitle: "habilitar o examinador:"),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: listaDeExaminador.length,
                              itemBuilder: (context, index) {
                                final ListaApiExaminador = listaDeExaminador.elementAt(index).data();

                                return Column(
                                  children: [
                                    CustomNavigationButton(
                                        name:
                                        "Exame do dia ${ListaApiExaminador["exameDoDia"]}, "
                                            "unidade de trânsito ${ListaApiExaminador["unidadeDeTransito"]}, "
                                            "local de exame: ${ListaApiExaminador["localDoExame"]}, "
                                            "categoria ${ListaApiExaminador["categoria"]}",
                                        onClick: () {
                                          Navigator.pushNamed(
                                            context,
                                            "/habilitar/habilitarExaminador/examePratico",
                                            arguments: ArgumentosExaminador(
                                              data: ListaApiExaminador["exameDoDia"],
                                              unidadeDeTransito: ListaApiExaminador["unidadeDeTransito"],
                                              localDoExame: ListaApiExaminador["localDoExame"],
                                              categoria: ListaApiExaminador["categoria"],
                                            ),
                                          );
                                        }
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  }
                  return const CirculoDeProgresso();
                }
            ),
          ),
        ],
      ),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readExaminador() async{
    final snap = await FirebaseFirestore.instance.collection("examinador").orderBy("nome").get();

    return snap;
  }
}
