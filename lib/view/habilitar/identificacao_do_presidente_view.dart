import 'package:boleto_digital/widgets/custom_user_recognition.dart';
import 'package:flutter/material.dart';

class IdentificacaoPresidente extends StatefulWidget {
  const IdentificacaoPresidente({Key? key}) : super(key: key);

  @override
  State<IdentificacaoPresidente> createState() => _IdentificacaoPresidenteState();
}

class _IdentificacaoPresidenteState extends State<IdentificacaoPresidente> {

  bool fotoTirada = false;

  @override
  Widget build(BuildContext context) {

    return CustomUserRecognition(
        title: "Habilitar presidente",
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
                  '/habilitar/habilitarPresidente/identificacao/presidenteAbilitadoSucesso');
            },
          );
        }
            : null,
        varFotoTirada: fotoTirada);
  }
}

