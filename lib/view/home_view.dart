import 'package:boleto_digital/widgets/custom_home_buttom.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detran.SP", style: TextStyle(fontSize: 45),)),
        backgroundColor: Cores.azul,
        toolbarHeight: 150,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Icon(Icons.mail, size: 55,),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 530,
            width: 650,
            child: ListView(
              children: [
                //const SizedBox(height: 250 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomHomeButton(
                        name: "Exames",
                        Icons: Icons.vertical_split,
                        onClick: () {
                          Navigator.pushNamed(context, "/exames");
                        }),
                    //const SizedBox(width: 150,),
                    CustomHomeButton(
                        name: "Habilitar",
                        Icons: Icons.lock_open,
                        onClick: () {
                          Navigator.pushNamed(context, "/habilitar");
                        }),
                  ],
                ),
                const SizedBox(height: 150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //const SizedBox(width: 80,),
                    CustomHomeButton(
                        name: "Relatórios",
                        Icons: Icons.bar_chart,
                        onClick: () {
                          Navigator.pushNamed(context, "/relatoriosExames");
                        }),
                    //const SizedBox(width: 145,),
                    CustomHomeButton(
                        name: "Boleto Offline",
                        Icons: Icons.wifi_off,
                        onClick: () {
                          Navigator.pushNamed(context, "/boletoOffline");
                        }),
                  ],
                ),
                //const SizedBox(height: 150,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
