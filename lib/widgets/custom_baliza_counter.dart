import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'custom_colors.dart';

class CustomBalizaCounter extends StatefulWidget {
  CustomBalizaCounter(
      {Key? key,
      required this.balizaDisplayTime,
      required this.temporaziadorBaliza,
      required this.isRunning,
      required this.bottomAdd,
      required this.bottomStop})
      : super(key: key);

  String balizaDisplayTime;
  StreamBuilder<int> temporaziadorBaliza;
  bool isRunning;
  void Function()? bottomAdd;
  void Function()? bottomStop;

  @override
  State<CustomBalizaCounter> createState() => _CustomBalizaCounterState();
}

class _CustomBalizaCounterState extends State<CustomBalizaCounter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Contador da Baliza:",
          style: TextStyle(
              color: Cores.vermelhoBotao,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          height: 100,
          width: 250,
          decoration: BoxDecoration(border: Border.all(width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: widget.temporaziadorBaliza,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: widget.bottomStop,
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: widget.isRunning == false
                            ? Cores.vermelho
                            : Cores.vermelhoBotao,
                      ),
                      child: const Center(
                          child: Text(
                        "Parar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: widget.bottomAdd,
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: widget.isRunning == false
                            ? Cores.verde
                            : Cores.verdeBaliza,
                      ),
                      child: const Center(
                          child: Text(
                        "Iniciar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
