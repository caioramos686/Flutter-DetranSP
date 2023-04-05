// To parse this JSON data, do
//
//     final relatorioExamesModel = relatorioExamesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RelatorioExamesModel> relatorioExamesModelFromJson(String str) => List<RelatorioExamesModel>.from(json.decode(str).map((x) => RelatorioExamesModel.fromJson(x)));

String relatorioExamesModelToJson(List<RelatorioExamesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelatorioExamesModel {
  RelatorioExamesModel({
    required this.data,
    required this.superintendencia,
    required this.examinador,
    required this.qntdRelatorios,
    required this.cfcs,
    required this.categoriasExame,
    required this.locais,
    required this.unidadeTransitos,
  });

  String data;
  String superintendencia;
  String examinador;
  List<QntdRelatorio> qntdRelatorios;
  List<Cfc> cfcs;
  List<CategoriasExame> categoriasExame;
  List<Locai> locais;
  List<UnidadeTransito> unidadeTransitos;

  factory RelatorioExamesModel.fromJson(Map<String, dynamic> json) => RelatorioExamesModel(
    data: json["data"],
    superintendencia: json["superintendencia"],
    examinador: json["examinador"],
    qntdRelatorios: List<QntdRelatorio>.from(json["qntdRelatorios"].map((x) => QntdRelatorio.fromJson(x))),
    cfcs: List<Cfc>.from(json["cfcs"].map((x) => Cfc.fromJson(x))),
    categoriasExame: List<CategoriasExame>.from(json["categoriasExame"].map((x) => CategoriasExame.fromJson(x))),
    locais: List<Locai>.from(json["locais"].map((x) => Locai.fromJson(x))),
    unidadeTransitos: List<UnidadeTransito>.from(json["unidadeTransitos"].map((x) => UnidadeTransito.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "superintendencia": superintendencia,
    "examinador": examinador,
    "qntdRelatorios": List<dynamic>.from(qntdRelatorios.map((x) => x.toJson())),
    "cfcs": List<dynamic>.from(cfcs.map((x) => x.toJson())),
    "categoriasExame": List<dynamic>.from(categoriasExame.map((x) => x.toJson())),
    "locais": List<dynamic>.from(locais.map((x) => x.toJson())),
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

class Cfc {
  Cfc({
    required this.cfc,
  });

  String cfc;

  factory Cfc.fromJson(Map<String, dynamic> json) => Cfc(
    cfc: json["cfc"],
  );

  Map<String, dynamic> toJson() => {
    "cfc": cfc,
  };
}

class Locai {
  Locai({
    required this.local,
  });

  String local;

  factory Locai.fromJson(Map<String, dynamic> json) => Locai(
    local: json["local"],
  );

  Map<String, dynamic> toJson() => {
    "local": local,
  };
}

class QntdRelatorio {
  QntdRelatorio({
    required this.qntdRelatorio,
  });

  int qntdRelatorio;

  factory QntdRelatorio.fromJson(Map<String, dynamic> json) => QntdRelatorio(
    qntdRelatorio: json["qntdRelatorio"],
  );

  Map<String, dynamic> toJson() => {
    "qntdRelatorio": qntdRelatorio,
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
