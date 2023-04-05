import 'dart:convert';

List<PresidenteModel> presidenteModelFromJson(String str) => List<PresidenteModel>.from(json.decode(str).map((x) => PresidenteModel.fromJson(x)));

String presidenteModelToJson(List<PresidenteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PresidenteModel {
  PresidenteModel({
    required this.data,
    required this.nome,
    required this.cpf,
    required this.unidadeBanca,
    required this.categorias,
    required this.locais,
  });

  String data;
  String nome;
  String cpf;
  String unidadeBanca;
  List<Categoria> categorias;
  List<Locai> locais;

  factory PresidenteModel.fromJson(Map<String, dynamic> json) => PresidenteModel(
    data: json["data"],
    nome: json["nome"],
    cpf: json["cpf"],
    unidadeBanca: json["unidadeBanca"],
    categorias: List<Categoria>.from(json["categorias"].map((x) => Categoria.fromJson(x))),
    locais: List<Locai>.from(json["locais"].map((x) => Locai.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "nome": nome,
    "cpf": cpf,
    "unidadeBanca": unidadeBanca,
    "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
    "locais": List<dynamic>.from(locais.map((x) => x.toJson())),
  };
}

class Categoria {
  Categoria({
    required this.categoria,
  });

  String categoria;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
    categoria: json["categoria"],
  );

  Map<String, dynamic> toJson() => {
    "categoria": categoria,
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
