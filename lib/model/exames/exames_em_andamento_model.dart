// To parse this JSON data, do
//
//     final examesAndamentoModel = examesAndamentoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ExamesAndamentoModel> examesAndamentoModelFromJson(String str) => List<ExamesAndamentoModel>.from(json.decode(str).map((x) => ExamesAndamentoModel.fromJson(x)));

String examesAndamentoModelToJson(List<ExamesAndamentoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamesAndamentoModel {
  ExamesAndamentoModel({
    required this.examinador,
    required this.candidato,
    required this.categoria,
    required this.resultado,
    required this.estadoBoolean,
  });

  String examinador;
  String candidato;
  String categoria;
  String resultado;
  bool estadoBoolean;

  factory ExamesAndamentoModel.fromJson(Map<String, dynamic> json) => ExamesAndamentoModel(
    examinador: json["examinador"],
    candidato: json["candidato"],
    categoria: json["categoria"],
    resultado: json["resultado"],
    estadoBoolean: json["estadoBoolean"],
  );

  Map<String, dynamic> toJson() => {
    "examinador": examinador,
    "candidato": candidato,
    "categoria": categoria,
    "resultado": resultado,
    "estadoBoolean": estadoBoolean,
  };
}
