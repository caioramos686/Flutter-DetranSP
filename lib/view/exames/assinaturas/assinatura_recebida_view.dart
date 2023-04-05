import 'package:flutter/material.dart';

import '../../../widgets/custom_colors.dart';

class AssinaturaRecebida extends StatefulWidget {
  const AssinaturaRecebida({Key? key}) : super(key: key);

  @override
  State<AssinaturaRecebida> createState() => _AssinaturaRecebidaState();
}

class _AssinaturaRecebidaState extends State<AssinaturaRecebida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Exames",
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF8EEB66),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.green,
                  )),
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Center(
                child: Text(
                  "Assinatura Recebida com Sucesso!",
                  style: TextStyle(fontSize: 40, color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Após enviar o exame do candidato, este será submetido a aprovação do presidente da banca", style: TextStyle(fontSize: 26),),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Cores.azul, borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: const Center(
                    child: Text(
                      "ENVIAR",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
*
* */