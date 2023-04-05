class PlacaModel {
  PlacaModel({
    required this.placaCerta,
    required this.placaErrada,
  });
  late final String placaCerta;
  late final String placaErrada;

  PlacaModel.fromJson(Map<String, dynamic> json){
    placaCerta = json['placaCerta'];
    placaErrada = json['placaErrada'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['placaCerta'] = placaCerta;
    _data['placaErrada'] = placaErrada;
    return _data;
  }
}