import 'package:flutter/material.dart';

import '../../../widgets/custom_colors.dart';

class AssinaturaRecebidaBanca extends StatelessWidget {
  const AssinaturaRecebidaBanca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF088343),
                border: Border.all(
                  width: 1.5,
                  color: Colors.green,

                )),
            width: double.infinity,
            height: 110,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: const Center(
              child: Text(
                "Assinatura Recebida!",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF96c3ec),
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xFF96c3ec),
                )),
            width: double.infinity,
            height: 140,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: const Center(
              child: Text(
                "Banca finalizada com sucesso!",
                style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF4e9adf),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 60,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        },
                        child: const Text(
                          "Voltar ao Menu",
                          style: TextStyle(fontSize: 28),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
