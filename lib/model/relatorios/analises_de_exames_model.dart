// To parse this JSON data, do
//
//     final analiseExamesModel = analiseExamesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AnaliseExamesModel> analiseExamesModelFromJson(String str) => List<AnaliseExamesModel>.from(json.decode(str).map((x) => AnaliseExamesModel.fromJson(x)));

String analiseExamesModelToJson(List<AnaliseExamesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnaliseExamesModel {
  AnaliseExamesModel({
    required this.tipoAnalise,
    required this.data,
    required this.categoriasExame,
    required this.unidadeTransitos,
  });

  String tipoAnalise;
  String data;
  List<CategoriasExame> categoriasExame;
  List<UnidadeTransito> unidadeTransitos;

  factory AnaliseExamesModel.fromJson(Map<String, dynamic> json) => AnaliseExamesModel(
    tipoAnalise: json["tipoAnalise"],
    data: json["data"],
    categoriasExame: List<CategoriasExame>.from(json["categoriasExame"].map((x) => CategoriasExame.fromJson(x))),
    unidadeTransitos: List<UnidadeTransito>.from(json["unidadeTransitos"].map((x) => UnidadeTransito.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tipoAnalise": tipoAnalise,
    "data": data,
    "categoriasExame": List<dynamic>.from(categoriasExame.map((x) => x.toJson())),
    "unidadeTransitos": List<dynamic>.from(unidadeTransitos.map((x) => x.toJson())),
  };
}

class CategoriasExame {
  CategoriasExame({
    required this.categoriaExame,
  });

  String categoriaExame;

  factory CategoriasExame.fromJson(Map<String, dynamic> json) => CategoriasExame(
    categoriaExame: json["categoriaExame"],
  );

  Map<String, dynamic> toJson() => {
    "categoriaExame": categoriaExame,
  };
}

class UnidadeTransito {
  UnidadeTransito({
    required this.unidadeTransito,
  });

  String unidadeTransito;

  factory UnidadeTransito.fromJson(Map<String, dynamic> json) => UnidadeTransito(
    unidadeTransito: json["unidadeTransito"],
  );

  Map<String, dynamic> toJson() => {
    "unidadeTransito": unidadeTransito,
  };
}
