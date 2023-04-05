import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';
import '../../widgets/custom_button_half.dart';

class RecuperacaoSenha3View extends StatefulWidget {
  @override
  _RecuperacaoSenha3ViewState createState() => _RecuperacaoSenha3ViewState();
}

class _RecuperacaoSenha3ViewState extends State<RecuperacaoSenha3View> {
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
                    "Clique no link enviado para o e-mail:\n"
                        "${emailController.text}\n"
                        "para cadastrar a nova senha.",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                  CustomButtonHalf(
                      name: "VOLTAR A TELA DE LOGIN",
                      onClick: (){
                        Navigator.pushNamed(context,
                            '/login');
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  final snackBarLogin = SnackBar(
    content: Text(
      "CPF ou Senha estão inválidos",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
  final snackBarRecuperarSenha = SnackBar(
    content: Text(
      "CPF está inválido",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
}
