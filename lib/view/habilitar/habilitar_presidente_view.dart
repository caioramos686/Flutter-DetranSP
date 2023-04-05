import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/habilitar/argumentos_presidente_model.dart';
import '../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/custom_text_title.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_error_api_fetch.dart';

class HabilitarPresidente extends StatefulWidget {
  HabilitarPresidente({Key? key}) : super(key: key);

  @override
  State<HabilitarPresidente> createState() => _HabilitarPresidenteState();
}

class _HabilitarPresidenteState extends State<HabilitarPresidente> {
  @override
  void initState() {
    super.initState();
  }

  String unidadeBanca = "";
  bool unidadeBancaVisibible = false;
  TextEditingController controllerUnidadeBanca = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: "Habilitar presidente",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextTitle(textTitle: "Selecione a unidade da Banca:"),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomSearchField(
              name: "Selecione a unidade da Banca",
              controller: controllerUnidadeBanca,
              onClick: () {
                setState(() {
                  unidadeBanca = controllerUnidadeBanca.text;
                  FocusScope.of(context).unfocus();
                });
                Future.delayed(const Duration(seconds: 1))
                    .then((value) =>
                    setState(() {
                      unidadeBancaVisibible = true;
                    }),
                );
              },
            ),
          ),
          Expanded(
            child: controllerUnidadeBanca.text.isEmpty
                ? FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    future: readPresidente(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const ErroTempoLimiteApi(
                          nome: "Unidade da Banca",
                        );
                      }
                      else if (snapshot.hasData) {
                        final listaCategorias = snapshot.data!.docs;

                        return ListView.builder(
                            itemCount: listaCategorias.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomNavigationButton(
                                    name: listaCategorias
                                        .elementAt(index)
                                        .data()["unidadeBanca"],
                                    onClick: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/habilitar/habilitarPresidente/habilitarPresidenteCategoria",
                                        arguments: ArgumentosPresidente(
                                          nome: listaCategorias
                                              .elementAt(index)
                                              .data()["nome"],
                                          cpf: listaCategorias
                                              .elementAt(index)
                                              .data()["cpf"],
                                          unidadeDaBanca: listaCategorias
                                              .elementAt(index)
                                              .data()["unidadeBanca"],
                                          data: listaCategorias
                                              .elementAt(index)
                                              .data()["data"],
                                          categorias: listaCategorias
                                              .elementAt(index)
                                              .data()["categorias"],
                                          locais: listaCategorias
                                              .elementAt(index)
                                              .data()["locais"],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                      return const CirculoDeProgresso();
                    })
                : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: readPresidenteLocal(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Visibility(
                          visible: unidadeBancaVisibible,
                          child: const ErroTempoLimiteApi(
                            nome: "Unidade da Banca",
                          ),
                        );
                      }
                      else if (snapshot.hasData) {
                        final listaCategorias = snapshot.data!;

                        return Column(
                          children: [
                            CustomNavigationButton(
                              name: listaCategorias["unidadeBanca"],
                              onClick: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/habilitar/habilitarPresidente/habilitarPresidenteCategoria",
                                    arguments: ArgumentosPresidente(
                                      nome: listaCategorias["nome"],
                                      cpf: listaCategorias["cpf"],
                                      unidadeDaBanca: listaCategorias["unidadeBanca"],
                                      data: listaCategorias["data"],
                                      categorias: listaCategorias["categorias"],
                                      locais: listaCategorias["locais"]
                                    ),
                                  );
                              },
                            ),
                          ],
                        );
                      }
                      return const CirculoDeProgresso();
                    }),
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
        .doc(unidadeBanca)
        .get();
    return snap;
  }
}
