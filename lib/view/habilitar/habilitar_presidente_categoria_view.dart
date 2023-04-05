import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/habilitar/argumentos_presidente_model.dart';
import '../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/custom_text_title.dart';
import '../../widgets/custom_progress_circle.dart';
import '../../widgets/custom_error_api_fetch.dart';

class HabilitarPresidenteCategoria extends StatefulWidget {
  HabilitarPresidenteCategoria({Key? key}) : super(key: key);
  static const routeName =
      '/habilitar/habilitarPresidente/habilitarPresidenteCategoria';

  @override
  State<HabilitarPresidenteCategoria> createState() =>
      _HabilitarPresidenteCategoriaState();
}

class _HabilitarPresidenteCategoriaState
    extends State<HabilitarPresidenteCategoria> {

    String categoria = "";
    bool categoriaVisibible = false;
    TextEditingController controllerCategoria = TextEditingController();

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
                    textTitle: "${argumentos.unidadeDaBanca}"
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextTitle(
                    textTitle: "Selecione a categoria:"
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: CustomSearchField(
              name: "Selecione a Categoria",
              controller: controllerCategoria,
              onClick: () {
                setState(() {
                  categoria = controllerCategoria.text;
                  FocusScope.of(context).unfocus();
                });
                Future.delayed(const Duration(seconds: 1)).then((value) =>
                    setState(() {
                      categoriaVisibible = true;
                    }),
                );
              },
            ),
          ),
          Expanded(
            child: controllerCategoria.text.isEmpty ?
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>> (
              future: readPresidente(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const ErroTempoLimiteApi(
                    nome: "Categoria",
                  );
                }
                else if (snapshot.hasData) {
                  final listaCategorias = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: argumentos.categorias?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CustomNavigationButton(
                              name: argumentos.categorias?[index]["categoria"],
                              onClick: () {
                                Navigator.pushNamed(
                                  context,
                                  "/habilitar/habilitarPresidente/habilitarPresidenteLocal",
                                  arguments: ArgumentosPresidente(
                                    nome: argumentos.nome,
                                    cpf: argumentos.cpf,
                                    unidadeDaBanca: argumentos.unidadeDaBanca,
                                    data: argumentos.data,
                                    categoria: argumentos.categorias?[index]["categoria"],
                                    locais: listaCategorias.elementAt(index).data()["locais"],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      });
                }
                return const CirculoDeProgresso();
              },
            ) :
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>> (
              future: readPresidenteCategoria(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Visibility(
                    visible: categoriaVisibible,
                    child: const ErroTempoLimiteApi(
                      nome: "Categoria",
                    ),
                  );
                }
                else if (snapshot.hasData) {
                  final listaCategorias = snapshot.data!;
                  return Column(
                    children: [
                      CustomNavigationButton(
                        name: listaCategorias["categoria"],
                        onClick: () {
                          Navigator.pushNamed(
                            context,
                            "/habilitar/habilitarPresidente/habilitarPresidenteLocal",
                            arguments: ArgumentosPresidente(
                              nome: argumentos.nome,
                              cpf: argumentos.cpf,
                              unidadeDaBanca: argumentos.unidadeDaBanca,
                              data: argumentos.data,
                              categoria: listaCategorias["categoria"],
                              locais: argumentos.locais,
                            ),
                          );
                        },
                      ),
                    ],
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


  Future<DocumentSnapshot<Map<String, dynamic>>> readPresidenteCategoria() async {
    final snap = await FirebaseFirestore.instance
        .collection('presidente')
        .doc(categoria)
        .get();
    return snap;
  }

}
