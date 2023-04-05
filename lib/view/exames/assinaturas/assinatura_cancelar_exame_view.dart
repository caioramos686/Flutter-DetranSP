import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_signature.dart';
import 'package:flutter/material.dart';

class AssinaturaCancelarExame extends StatefulWidget {
  const AssinaturaCancelarExame({Key? key}) : super(key: key);

  @override
  State<AssinaturaCancelarExame> createState() => _AssinaturaCancelarExameState();
}

class _AssinaturaCancelarExameState extends State<AssinaturaCancelarExame> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: 'Exames',
      body: CustomSignature(
        nomeAssinatura: 'presidente teste 1',
        tipoAssinatura: 'Presidente',
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(context, "/assinaturaCancelarExameRecebida", (route) => false);
          });
        },
      ),
    );
  }
}
