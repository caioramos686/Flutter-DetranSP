import 'package:flutter/material.dart';

import '../../widgets/custom_user_recognition.dart';

class IdentificacaoCandidato extends StatefulWidget {
  const IdentificacaoCandidato({Key? key}) : super(key: key);

  @override
  State<IdentificacaoCandidato> createState() => _IdentificacaoCandidatoState();
}

class _IdentificacaoCandidatoState extends State<IdentificacaoCandidato> {

  bool fotoTirada = false;

  @override
  Widget build(BuildContext context) {

    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String nome = modalRoute["nome"].toString();
    String categoria = modalRoute["categoria"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();
    String cpf = modalRoute["cpf"].toString();
    String renach = modalRoute["renach"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String dia = modalRoute["dia"].toString();

    return CustomUserRecognition(title: "Exames",
        onTapFoto: () {
          Navigator.pushNamed(context, '/camera');
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              fotoTirada = true;
            });
          });
        },
        onTapButton: fotoTirada == true ?() {
          setState(() {
            Navigator.pushNamed(context, '/candidatoAutenticado', arguments: {
              "nome": nome,
              "localDoExame": localDoExame,
              "categoria": categoria,
              "cpf": cpf,
              "renach": renach,
              "unidadeDeTransito": unidadeDeTransito,
              "dia": dia
            });
          });
        } : null,
        varFotoTirada: fotoTirada);}
}
