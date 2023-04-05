import 'package:flutter/material.dart';

import 'custom_fonts.dart';

class CustomNavigationButton extends StatelessWidget {
  final String name;
  final Function onClick;
  final String? subtitle;

  const CustomNavigationButton({Key? key, required this.name, required this.onClick, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 0.5), bottom: BorderSide(width: 0.5))
          ),
          child: Center(
            child: ListTile(
              textColor: Colors.black,
              title: Text(name, style: Fontes.tamanhoPadrao,),
              trailing: const Icon(Icons.arrow_forward_ios),
              subtitle: subtitle == null ? null : Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(subtitle!, style: Fontes.tamanhoPadrao),
              )
            ),
          ),
        ),
      ),
    );
  }
}
