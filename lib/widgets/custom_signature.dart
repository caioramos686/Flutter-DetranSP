import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'custom_colors.dart';


class CustomSignature extends StatefulWidget {
  CustomSignature({Key? key, required this.nomeAssinatura, required this.onTap, this.tipoAssinatura = "Candidato"}) : super(key: key);

  String nomeAssinatura;
  String tipoAssinatura;
  void Function()? onTap;

  @override
  State<CustomSignature> createState() => _CustomSignatureState();
}

class _CustomSignatureState extends State<CustomSignature> {

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Assinatura do ${widget.tipoAssinatura}",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Nome: ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.nomeAssinatura,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: MediaQuery.of(context).devicePixelRatio * 1.0,
              maximumStrokeWidth: MediaQuery.of(context).devicePixelRatio * 4.0,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "Assinatura:",
            style: TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: _handleClearButtonPressed,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).devicePixelRatio * 60,
                width: MediaQuery.of(context).devicePixelRatio * 300,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(width: 1, color: Cores.azul)),
                child: Center(
                    child: Text(
                      "LIMPAR",
                      style: TextStyle(color: Cores.azul, fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
            ),
            InkWell(
              onTap: widget.onTap,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                    color: Cores.azul, borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: const Center(
                    child: Text(
                      "SALVAR",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
