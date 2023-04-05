import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/habilitar/argumentos_presidente_model.dart';
import '../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/custom_text_title.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_error_api_fetch.dart';

class HabilitarPresidenteLocal extends StatefulWidget {
  HabilitarPresidenteLocal({Key? key}) : super(key: key);
  static const routeName =
      '/habilitar/habilitarPresidente/habilitarPresidenteLocal';

  @override
  State<HabilitarPresidenteLocal> createState() =>
      _HabilitarPresidenteLocalState();
}


class _HabilitarPresidenteLocalState extends State<HabilitarPresidenteLocal> {

  String local = "";
  bool localVisibible = false;
  TextEditingController controllerLocal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosPresidente;

    return CustomScaffold(
      textAppBar: "Habilitar presidente",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextTitle(
                  textTitle: "${argumentos.unidadeDaBanca}, ${argumentos.categoria}",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextTitle(
                  textTitle: "Selecione o local:",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,bottom: 20),
            child: CustomSearchField(
              name: "Selecione o Local",
              controller: controllerLocal,
              onClick: () {
                setState(() {
                  local = controllerLocal.text;
                  FocusScope.of(context).unfocus();
                });
                Future.delayed(const Duration(seconds: 1)).then((value) =>
                    setState(() {
                      localVisibible = true;
                    }),
                );
              },
            ),
          ),
          Expanded(
            child: controllerLocal.text.isEmpty ?
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: readPresidente(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const ErroTempoLimiteApi(
                    nome: "Local",
                  );
                }
                else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: argumentos.locais?.length,//argumentos.locais?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomNavigationButton(
                            name: argumentos.locais?[index]["local"],//listaCategorias[index].locais[0].local,
                            onClick: () {

                              Navigator.pushNamed(
                                context,
                                "/habilitar/habilitarPresidente/identificacao",
                                arguments: ArgumentosPresidente(
                                  nome: argumentos.nome,
                                  cpf: argumentos.cpf,
                                  unidadeDaBanca: argumentos.unidadeDaBanca,
                                  data: argumentos.data,
                                  categoria: argumentos.categoria,
                                  local: argumentos.locais?[index]["local"],
                                ),
                              );

                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return const CirculoDeProgresso();
              },
            ) :
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: readPresidenteLocal(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Visibility(
                    visible: localVisibible,
                    child: const ErroTempoLimiteApi(
                      nome: "Local",
                    ),
                  );
                }
                else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomNavigationButton(
                            name: argumentos.locais?[index]["local"],
                            onClick: () {
                              Navigator.pushNamed(
                                context,
                                "/habilitar/habilitarPresidente/identificacao",
                                arguments: ArgumentosPresidente(
                                  nome: argumentos.nome,
                                  cpf: argumentos.cpf,
                                  unidadeDaBanca: argumentos.unidadeDaBanca,
                                  data: argumentos.data,
                                  categoria: argumentos.categoria,
                                  local: argumentos.locais?[index]["local"],
                                ),
                              );

                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return const CirculoDeProgresso();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readPresidente() async {
    final snap = await FirebaseFirestore.instance
        .collection('presidente')
        .orderBy("nome")
        .get();
    return snap;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readPresidenteLocal() async {
    final snap = await FirebaseFirestore.instance
        .collection('presidente')
        .doc(local)
        .get();
    return snap;
  }

}
