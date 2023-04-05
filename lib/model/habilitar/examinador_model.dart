import 'dart:convert';

List<ExaminadorModel> examinadorModelFromJson(String str) => List<ExaminadorModel>.from(json.decode(str).map((x) => ExaminadorModel.fromJson(x)));

String examinadorModelToJson(List<ExaminadorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExaminadorModel {
  ExaminadorModel({
    required this.exameDoDia,
    required this.cpf,
    required this.unidadeDeTransito,
    required this.localDoExame,
    required this.categoria,
    required this.nome,
  });

  String exameDoDia;
  String cpf;
  String unidadeDeTransito;
  String localDoExame;
  String categoria;
  String nome;

  factory ExaminadorModel.fromJson(Map<String, dynamic> json) => ExaminadorModel(
    exameDoDia: json["exameDoDia"],
    cpf: json["cpf"],
    unidadeDeTransito: json["unidadeDeTransito"],
    localDoExame: json["localDoExame"],
    categoria: json["categoria"],
    nome: json["nome"],
  );

  Map<String, dynamic> toJson() => {
    "exameDoDia": exameDoDia,
    "cpf": cpf,
    "unidadeDeTransito": unidadeDeTransito,
    "localDoExame": localDoExame,
    "categoria": categoria,
    "nome": nome,
  };
}
