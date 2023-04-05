import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../widgets/custom_colors.dart';

class SignaturePadApp extends StatefulWidget {
  SignaturePadApp({Key? key}) : super(key: key);

  @override
  _SignaturePadAppState createState() => _SignaturePadAppState();
}

class _SignaturePadAppState extends State<SignaturePadApp> {
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

    final modalRoute = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    String nome = modalRoute["nome"].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assinatura",
          style: TextStyle(fontSize: 45),
        ),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          );
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Assinatura do Candidato",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                nome,
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
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black54), top: BorderSide(color: Colors.black54),),
              ),
              child: SfSignaturePad(
                key: signatureGlobalKey,
                backgroundColor: Colors.white,
                strokeColor: Colors.black,
                minimumStrokeWidth: 1.0,
                maximumStrokeWidth: 4.0,
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
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(width: 1, color: Color(0xFF355CEB))),
                  child: const Center(
                      child: Text(
                        "LIMPAR",
                        style: TextStyle(color: Color(0xFF355CEB), fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, "/assinaturaRecebida");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 300,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color(0xFF355CEB), borderRadius: BorderRadius.all(Radius.circular(6))),
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
      ),
    );
  }
}
