import 'dart:convert';
import 'package:boleto_digital/model/habilitar/examinador_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as custom_api_fetch;
import 'package:http/http.dart' as http;

import '../../model/habilitar/presidente_model.dart';
/*
Future apiPresidente({required String parametroUrl}) async {
  final url = parametroUrl;
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return custom_api_fetch.jsonDecode(response.body);
  } else {
    throw Exception("Não foi possivel carregar os dados da Api");
  }
}

 */


Future<PresidenteModel> apiPresidente({required String parametroUrl}) async {
  final url = parametroUrl;
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(utf8.decode(response.bodyBytes));
    return PresidenteModel.fromJson(responseBody);
  } else {
    throw Exception("Não foi possivel carregar os dados da Api");
  }
}