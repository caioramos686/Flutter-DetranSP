import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import '../../../model/habilitar/argumentos_examinador_model.dart';
import '../../widgets/custom_alert_sucess.dart';
import '../../widgets/custom_button_full.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_bold.dart';


class ExaminadorAtribuido extends StatelessWidget {
  const ExaminadorAtribuido({Key? key}) : super(key: key);
  static const routeName = '/habilitar/habilitarExaminador/examePratico/examinadorAtribuido';

  @override
  Widget build(BuildContext context) {
    final argumentos =
    ModalRoute.of(context)!.settings.arguments as ArgumentosExaminador;

    return CustomScaffold(
        textAppBar: "Habilitar examinador",
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const CustomAlertSucess(
                    text: "Examinador atribuído com sucesso"
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            const CustomText(
                                text: "Nome: "
                            ),
                            CustomTextBold(
                                text: "${argumentos.nome}"
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomText(
                                text: "CPF: "
                            ),
                            CustomTextBold(
                                text: "${argumentos.cpf}"
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomText(
                                text: "Categoria: "
                            ),
                            CustomTextBold(
                                text: "${argumentos.categoria}"
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Column(
                            children: [
                              const CustomText(
                                  text: "Solicite um documento do examinador e valide"
                              ),
                              const CustomText(
                                  text: "se os dados conferem."
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Para habilitar o examinador é necessário",
                                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "realizar o reconhecimento biométrico facial:",
                                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 150,),
                              CustomButtonFull(
                                name: "Avançar",
                                onClick: () {
                                  Navigator.pushNamed(context, '/identificacaoDoExaminador');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),);
  }
}
