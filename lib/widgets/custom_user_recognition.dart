import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomUserRecognition extends StatefulWidget {
  final String title;
  var onTapFoto;
  var onTapButton;
  final bool varFotoTirada;

  CustomUserRecognition({Key? key, required this.title, required this.onTapFoto, required this.onTapButton, required this.varFotoTirada}) : super(key: key);

  @override
  _CustomUserRecognitionState createState() => _CustomUserRecognitionState();
}

class _CustomUserRecognitionState extends State<CustomUserRecognition> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(textAppBar: widget.title, body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Identificação do candidato", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Reconhecimento facial", style: TextStyle(color: Cores.azul, fontSize: 24),),
            ),
            SizedBox(
              height: MediaQuery.of(context).devicePixelRatio * 50,
            ),
            InkWell(
              onTap: widget.onTapFoto,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).devicePixelRatio * 500,
                      height: MediaQuery.of(context).devicePixelRatio * 500,
                      decoration: BoxDecoration(
                          border: Border.all(width: MediaQuery.of(context).devicePixelRatio * 5, style: BorderStyle.solid)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 51, top: 51),
                      child: Icon(Icons.person, size: 400,),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).devicePixelRatio * 100,
            ),
            InkWell(
              onTap: widget.onTapButton,
              child: Container(
                margin: const EdgeInsets.all(14),
                width: double.infinity,
                height: MediaQuery.of(context).devicePixelRatio * 80,
                color: widget.varFotoTirada == true ? Cores.azul : Colors.grey,
                child: const Center(
                  child: Text(
                    "Avançar",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),);
  }
}
