import 'package:boleto_digital/widgets/custom_text_input.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_colors.dart';
import '../../widgets/custom_button_half.dart';
import '../../widgets/custom_text_button.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final cpfController = TextEditingController();
  final senhaController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String cpfAcesso1 = "123.456.789-10";
  final String cpfAcesso2 = "012.345.678-90";
  final String cpfAcesso3 = "987.654.321-00";
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
                      "FAZER LOGIN",
                      style: TextStyle(
                        fontSize: 35,
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
                          CpfInputFormatter(),], nomeDoCampo: 'CPF: ',
                    ),
                    SizedBox(height: 10),

                    CustomTextInput(
                      controller: senhaController,
                      dicaCampo: "sua senha",
                      obscureText: true,
                      keyboardType: TextInputType.text, nomeDoCampo: 'SENHA: ',
                    ),
                    SizedBox(height: 30),
                    CustomButtonHalf(
                        name: "ENTRAR",
                        onClick: (){
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (formkey.currentState!.validate()) {
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (senhaController.text == "1234") {
                              if (cpfController.text == cpfAcesso1 ||
                                  cpfController.text == cpfAcesso2 ||
                                  cpfController.text == cpfAcesso3) {
                                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                              } else {
                                senhaController.clear();
                                ScaffoldMessenger.of(context).showSnackBar(snackBarLogin);
                              }
                            } else {
                              senhaController.clear();
                              ScaffoldMessenger.of(context).showSnackBar(snackBarLogin);
                            }
                          }
                        }),
                    SizedBox(height: 10),
                    CustomTextButton(
                        name: "Esqueci minha senha",
                        onClick: (){
                      Navigator.pushNamed(context,
                          '/login/recuperacaoSenha1');
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
