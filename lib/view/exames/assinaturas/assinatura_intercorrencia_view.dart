import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:boleto_digital/widgets/custom_signature.dart';
import 'package:flutter/material.dart';

class AssinaturaIntercorrencia extends StatefulWidget {
  const AssinaturaIntercorrencia({Key? key}) : super(key: key);

  @override
  State<AssinaturaIntercorrencia> createState() => _AssinaturaIntercorrenciaState();
}

class _AssinaturaIntercorrenciaState extends State<AssinaturaIntercorrencia> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppBar: 'Exames',
      body: CustomSignature(
        nomeAssinatura: 'presidente teste 1',
        tipoAssinatura: 'Presidente',
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(context, "/assinaturaIntercorrenciaRecebida", (route) => false);
          });
        },
      ),
    );
  }
}
