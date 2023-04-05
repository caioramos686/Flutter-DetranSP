class CandidatoModel {
  CandidatoModel({
    required this.nome,
    required this.horario,
    required this.categoria,
    required this.cpf,
    required this.renach,
  });
  late final String nome;
  late final String horario;
  late final String categoria;
  late final String cpf;
  late final String renach;

  CandidatoModel.fromJson(Map<String, dynamic> json){
    nome = json['nome'];
    horario = json['horario'];
    categoria = json['categoria'];
    cpf = json['cpf'];
    renach = json['renach'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nome'] = nome;
    _data['horario'] = horario;
    _data['categoria'] = categoria;
    _data['cpf'] = cpf;
    _data['renach'] = renach;
    return _data;
  }
}