import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_colors.dart';
import '../../widgets/custom_button_half.dart';
import '../../widgets/custom_text_input.dart';

class RecuperacaoSenha1View extends StatefulWidget {
  @override
  _RecuperacaoSenha1ViewState createState() => _RecuperacaoSenha1ViewState();
}

class _RecuperacaoSenha1ViewState extends State<RecuperacaoSenha1View> {
  final cpfController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String cpfAcesso1 = "123.456.789-10";
  final emailController = TextEditingController();

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
            Form(
              key: formkey,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 200,
                  vertical: 300,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "RECUPERAR SENHA",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextInput(
                      controller: cpfController,
                      dicaCampo: "seu CPF",
                      keyboardType: TextInputType.number,
                      inputKeyboardType: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),], nomeDoCampo: 'CPF:',
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 30),
                    CustomButtonHalf(
                        name: "CONTINUAR",
                        onClick: (){
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (formkey.currentState!.validate()) {
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (cpfController.text == cpfAcesso1) {
                              Navigator.pushNamed(context,
                                  '/login/recuperacaoSenha2');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(snackBarLogin);
                            }
                          }
                        }),
                  ],
                ),
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
