import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../model/habilitar/argumentos_presidente_model.dart';
import '../../model/habilitar/presidente_model.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_bold.dart';
import '../../widgets/custom_text_title.dart';

class HabilitarIdentificacaoPresidente extends StatelessWidget {
  const HabilitarIdentificacaoPresidente({Key? key}) : super(key: key);
  static const routeName = '/habilitar/habilitarPresidente/identificacao';

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosPresidente;

    return CustomScaffold(
      textAppBar: "Habilitar presidente",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: CustomTextTitle(
                    textTitle: "Identificação",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const CustomTextBold(text: "Nome: "),
                CustomText(text: "${argumentos.nome}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  const CustomTextBold(text: "CPF: "),
                  CustomText(text: "${argumentos.cpf}"),
                ],
              ),
            ),
            Row(
              children: [
                const CustomTextBold(text: "Categoria: "),
                CustomText(text: "${argumentos.categoria}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomTextBold(text: "Data: "),
                      CustomText(text: "${argumentos.data}"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const CustomTextBold(text: "Unidade de Trânsito: "),
                        CustomText(text: "${argumentos.unidadeDaBanca}"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const CustomTextBold(text: "Local do Exame: "),
                      CustomText(text: "${argumentos.local}"),
                    ],
                  ),
                ],
              ),
            ),
            const CustomTextTitle(
                textTitle: "Para se habilitar é necessário realizar o "),
            const CustomTextTitle(
                textTitle: "reconhecimento biométrico facial: "),
            const SizedBox(
              height: 40,
            ),
            CustomButtonFull(
              name: "Avançar",
              onClick: () {
                Navigator.pushNamed(context,
                    '/habilitar/habilitarPresidente/identificacao/habilitarIdentificacaoPresidente');
              },
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<PresidenteModel>> readUsers() => FirebaseFirestore.instance
      .collection('presidente')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => PresidenteModel.fromJson(doc.data()))
          .toList());
}
