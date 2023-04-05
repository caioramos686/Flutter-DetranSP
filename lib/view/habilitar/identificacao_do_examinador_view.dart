import 'dart:io';
import 'package:flutter/material.dart';
import '../../widgets/custom_user_recognition.dart';

class IdentificacaoExaminador extends StatefulWidget {
  IdentificacaoExaminador({Key? key}) : super(key: key);

  @override
  State<IdentificacaoExaminador> createState() =>
      _IdentificacaoPresidenteState();
}

class _IdentificacaoPresidenteState extends State<IdentificacaoExaminador> {
  File? imageSelecionada;
  bool fotoTirada = false;

  @override
  Widget build(BuildContext context) {
    return CustomUserRecognition(
        title: "Habilitar examinador",
        onTapFoto: () {
          Navigator.pushNamed(context, '/camera').then((image) {
            debugPrint("chegou no then: ${image}");
          });
          setState(() {
            fotoTirada = true;
          });
        },
        onTapButton: fotoTirada == true
            ? () {
                setState(
                  () {
                    Navigator.pushNamed(
                        context,
                        '/habilitar/habilitarExaminador/'
                        'examePratico/examinadorAbilitadoSucesso');
                  },
                );
              }
            : null,
        varFotoTirada: fotoTirada);
  }
}

