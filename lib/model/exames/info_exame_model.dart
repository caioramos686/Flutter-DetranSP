// To parse this JSON data, do
//
//     final presidenteModel = presidenteModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<InfoExameModel> infoExameModelFromJson(String str) => List<InfoExameModel>.from(json.decode(str).map((x) => InfoExameModel.fromJson(x)));

String infoExamModelToJson(List<InfoExameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoExameModel {
  InfoExameModel({
    required this.examinador,
    required this.candidato,
    required this.categoria,
    required this.resultado,
  });

  final String examinador;
  final String candidato;
  final String categoria;
  final String resultado;

  factory InfoExameModel.fromJson(Map<String, dynamic> json) => InfoExameModel(
    examinador: json["examinador"],
    candidato: json["candidato"],
    categoria: json["categoria"],
    resultado: json["resultado"],
  );

  Map<String, dynamic> toJson() => {
    "examinador": examinador,
    "candidato": candidato,
    "categoria": categoria,
    "resultado": resultado,
  };
}
