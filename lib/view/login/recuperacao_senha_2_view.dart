import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';
import '../../widgets/custom_button_half.dart';

class RecuperacaoSenha2View extends StatefulWidget {
  @override
  _RecuperacaoSenha2ViewState createState() => _RecuperacaoSenha2ViewState();
}

class _RecuperacaoSenha2ViewState extends State<RecuperacaoSenha2View> {
  final cpfController = TextEditingController(text: "123.456.789-10");
  final emailController = TextEditingController(text: "email01@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detran.SP",
            style: TextStyle(fontSize: 45),
          ),
          backgroundColor: Cores.azul,
          toolbarHeight: 150,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mail),
              iconSize: 45,
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.dehaze_outlined),
            iconSize: 50,
          ),
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 200,
                vertical: 300,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RECUPERAR SENHA",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Um e-mail com instruções para\n"
                        "cadastrar uma nova senha será\n"
                        "enviado para o e-mail cadastrado.\n"
                        "Por favor, confirme o envio clicando"
                        "\nno botão confirmar.",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "CPF:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 350,
                    height: 50,
                    child: Text(
                      "${cpfController.text}",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "E-mail cadastrado:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 350,
                    height: 50,
                    child: Text(
                      "${emailController.text}",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomButtonHalf(
                      name: "CONFIRMAR",
                      onClick: (){
                        Navigator.pushNamed(context,
                            '/login/recuperacaoSenha3');
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
