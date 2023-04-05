import 'package:boleto_digital/widgets/custom_text_title.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_colors.dart';


class RelatoriosView extends StatelessWidget {
  static const routeName = '/relatoriosExames';
  const RelatoriosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Relatórios",
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
        children: [
          const SizedBox(height: 50),
          CustomTextTitle(textTitle: "Seleciona qual relatório deseja visualizar:"),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context,
                    '/relatoriosExames/relatoriosDeExamesPratico');
              },
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1))
                ),
                child: const Center(
                  child: ListTile(
                    title: Text("Relatórios de exames", style: TextStyle(fontSize: 25),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context,
                    '/relatoriosExames/analisesDeExames');
              },
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1))
                ),
                child: const Center(
                  child: ListTile(
                    title: Text("Análises de exames", style: TextStyle(fontSize: 25),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context,
                  '/relatoriosExames/analisesDeAvaliacoes');
            },
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1))
              ),
              child: const Center(
                child: ListTile(
                  title: Text("Análises de avaliações", style: TextStyle(fontSize: 25),),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}