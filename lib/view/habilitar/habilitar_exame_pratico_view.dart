import 'package:boleto_digital/widgets/custom_progress_circle.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../model/habilitar/argumentos_examinador_model.dart';
import '../../../widgets/custom_navigation_button.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_error_api_fetch.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_bold.dart';
import '../../widgets/custom_text_title.dart';

class HabilitarExamePratico extends StatefulWidget {
  HabilitarExamePratico({Key? key}) : super(key: key);
  static const routeName = '/habilitar/habilitarExaminador/examePratico';

  @override
  State<HabilitarExamePratico> createState() => _HabilitarExamePraticoState();
}

class _HabilitarExamePraticoState extends State<HabilitarExamePratico> {
  @override
  void initState() {
    super.initState();
  }

  String cpfInput = "";
  bool CPFVisibible = false;
  final TextEditingController controllerCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argumentos =
    ModalRoute.of(context)!.settings.arguments as ArgumentosExaminador;

    return CustomScaffold(
      textAppBar: "Habilitar examinador",
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomTextTitle(
                      textTitle: "Exame prático"),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const CustomTextBold(text: "Data: "),
                      CustomText(text: "${argumentos.data}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CustomTextBold(text: "Unidade de trânsito: "),
                      CustomText(text: "${argumentos.unidadeDeTransito}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CustomTextBold(text: "Local do exame: "),
                      CustomText(text: "${argumentos.localDoExame}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CustomTextBold(text: "Categoria: "),
                      CustomText(text: "${argumentos.categoria}"),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(
                      text: "Selecione qual examinador quer habilitar:"
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomSearchField(
                    name: "Busque o examinador por CPF",
                    keyboardType: TextInputType.number,
                    inputKeyboardType: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    controller: controllerCpf,
                    onClick: () {
                      setState((){
                        cpfInput = controllerCpf.text.replaceAll(".", "").replaceAll("-", "");
                        FocusScope.of(context).unfocus();
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          CPFVisibible = true;
                        });
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
            controllerCpf.text.isEmpty ?
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: readExaminador(),
                builder: (context, snapshot) {

                  if (snapshot.hasError) {
                    return const ErroTempoLimiteApi(
                      nome: "CPF",
                    );
                  }
                  else if (snapshot.hasData) {
                    final listaDeExaminador = snapshot.data!.docs;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: listaDeExaminador.length,
                            itemBuilder: (context, index) {
                              return CustomNavigationButton(
                                name: listaDeExaminador.elementAt(index).data()["nome"],
                                onClick: () {
                                  if (listaDeExaminador.elementAt(index).data()["categoria"] == "B") {
                                    Navigator.pushNamed(
                                      context,
                                      '/habilitar/habilitarExaminador/examePratico/examinadorAtribuido',
                                      arguments: ArgumentosExaminador(
                                        nome: listaDeExaminador.elementAt(index).data()["nome"],
                                        cpf: listaDeExaminador.elementAt(index).data()["cpf"],
                                        categoria: listaDeExaminador.elementAt(index).data()["categoria"],
                                      ),
                                    );
                                  } else {
                                    Navigator.pushNamed(context,
                                        "/habilitar/habilitarExaminador/examePratico/erroHabilitacao");
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomButtonFull(
                            name: "Atribuir Examinador Manual",
                            onClick: () {

                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }
                  return const CirculoDeProgresso();
                }
            ) :
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>> (
                future: readExaminadorCPF(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Visibility(
                      visible: CPFVisibible,
                      child: const ErroTempoLimiteApi(
                        nome: "CPF",
                      ),
                    );
                  }
                  else if (snapshot.hasData) {
                    final listaDeExaminador = snapshot.data!;

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return CustomNavigationButton(
                                name: listaDeExaminador["nome"],
                                onClick: () {
                                  if (listaDeExaminador["categoria"] == "B") {
                                    Navigator.pushNamed(
                                      context,
                                      '/habilitar/habilitarExaminador/examePratico/examinadorAtribuido',
                                      arguments: ArgumentosExaminador(
                                        nome: listaDeExaminador["nome"],
                                        cpf: listaDeExaminador["cpf"],
                                        categoria: listaDeExaminador["categoria"],
                                      ),
                                    );
                                  } else {
                                    Navigator.pushNamed(context,
                                        "/habilitar/habilitarExaminador/examePratico/erroHabilitacao");
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomButtonFull(
                            name: "Atribuir Examinador Manual",
                            onClick: () {

                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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

  Future <QuerySnapshot<Map<String, dynamic>>>readExaminador() async {
    final snap = await FirebaseFirestore.instance.collection('examinador').orderBy("nome")
        .get();
    return snap;
  }

  Future <DocumentSnapshot<Map<String, dynamic>>> readExaminadorCPF() async {
    final snap =
    await FirebaseFirestore.instance.collection('examinador')
        .doc(cpfInput).get();
    return snap;
  }

}
