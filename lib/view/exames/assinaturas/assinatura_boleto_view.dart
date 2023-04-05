import 'dart:ui' as ui;

import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_signature.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../widgets/custom_colors.dart';

class AssinaturaBoleto extends StatefulWidget {
  AssinaturaBoleto({Key? key}) : super(key: key);

  @override
  _AssinaturaBoletoState createState() => _AssinaturaBoletoState();
}

class _AssinaturaBoletoState extends State<AssinaturaBoleto> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String nome = modalRoute["nome"].toString();

    return CustomScaffold(textAppBar: "Assinatura", body: CustomSignature(nomeAssinatura: nome, onTap: () {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(context, "/assinaturaRecebidaBoleto", (route) => false);
      });
    },),);
  }
}
