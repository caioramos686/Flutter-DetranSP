import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_signature.dart';
import 'package:flutter/material.dart';

class AssinaturaReprovarExame extends StatefulWidget {
  const AssinaturaReprovarExame({Key? key}) : super(key: key);

  @override
  State<AssinaturaReprovarExame> createState() => _AssinaturaReprovarExameState();
}

class _AssinaturaReprovarExameState extends State<AssinaturaReprovarExame> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: 'Exames',
      body: CustomSignature(
        nomeAssinatura: 'presidente teste 1',
        tipoAssinatura: 'Presidente',
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(context, "/assinaturaReprovarExameRecebida", (route) => false);
          });
        },
      ),
    );
  }
}
