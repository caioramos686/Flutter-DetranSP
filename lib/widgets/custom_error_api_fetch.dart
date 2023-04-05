import 'package:flutter/material.dart';

class ErroTempoLimiteApi extends StatelessWidget {
  final String? nome;
  const ErroTempoLimiteApi({Key? key, this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              title: const Icon(Icons.error, size: 150, color: Colors.green,),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(nome == null? 'Falha ao carregar a pagina,' : "${nome} não encontrado", style: const TextStyle(fontSize: 28),),
                    const Text('Tente novamente...', style: TextStyle(fontSize: 28),),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK', style: TextStyle(fontSize: 28),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
