// To parse this JSON data, do
//
//     final examesModel = examesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ExamesModel> examesModelFromJson(String str) => List<ExamesModel>.from(json.decode(str).map((x) => ExamesModel.fromJson(x)));

String examesModelToJson(List<ExamesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamesModel {
  ExamesModel({
    required this.dia,
    required this.unidadeDeTransito,
    required this.localDoExame,
    required this.categoria,
  });

  final String dia;
  final String unidadeDeTransito;
  final String localDoExame;
  final String categoria;

  factory ExamesModel.fromJson(Map<String, dynamic> json) => ExamesModel(
    dia: json["dia"],
    unidadeDeTransito: json["unidadeDeTransito"],
    localDoExame: json["localDoExame"],
    categoria: json["categoria"],
  );

  Map<String, dynamic> toJson() => {
    "dia": dia,
    "unidadeDeTransito": unidadeDeTransito,
    "localDoExame": localDoExame,
    "categoria": categoria,
  };
}
