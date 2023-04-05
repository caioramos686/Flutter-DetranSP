import 'package:boleto_digital/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';

class AprovarExame extends StatefulWidget {
  const AprovarExame({Key? key}) : super(key: key);

  @override
  State<AprovarExame> createState() => _AprovarExameState();
}

class _AprovarExameState extends State<AprovarExame> {
  @override
  Widget build(BuildContext context) {

    final modalRoute = ModalRoute.of(context)!.settings.arguments as Map;
    String categoriaExame = modalRoute["categoriaExame"].toString();
    String dia = modalRoute["dia"].toString();
    String unidadeDeTransito = modalRoute["unidadeDeTransito"].toString();
    String localDoExame = modalRoute["localDoExame"].toString();

    String nomePresidente = "Presidente teste 1";
    String cpfPresidente = "019.876.543-21";
    String categoriaPresidente = "A";


    return CustomScaffold(textAppBar: 'Exames', body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Confirmação de validação", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Nome: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(nomePresidente, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("CPF: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(cpfPresidente, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Categoria: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(categoriaPresidente, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Data: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(dia, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Unidade de Trânsito: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(unidadeDeTransito, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Local do Exame: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(localDoExame, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Categoria: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Text(categoriaExame, style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
        SizedBox(height: 40,),
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 10),
            child: Text("Para confirmar a validação dos exames é necessário realizar a assinatura digital", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),),
          ),
        ),
        SizedBox(height: 40,),
        InkWell(
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, "/assinaturaAprovarExame");
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: Cores.azul, borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: const Center(
                child: Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                )),
          ),
        ),
      ],
    ));
  }
}
