import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_signature.dart';
import 'package:flutter/material.dart';

class AssinaturaAprovarExame extends StatefulWidget {
  const AssinaturaAprovarExame({Key? key}) : super(key: key);

  @override
  State<AssinaturaAprovarExame> createState() => _AssinaturaAprovarExameState();
}

class _AssinaturaAprovarExameState extends State<AssinaturaAprovarExame> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: 'Exames',
      body: CustomSignature(
        nomeAssinatura: 'presidente teste 1',
        tipoAssinatura: 'Presidente',
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(context, "/assinaturaAprovarExameRecebida", (route) => false);
          });
        },
      ),
    );
  }
}
