import 'dart:convert';
import 'package:boleto_digital/model/habilitar/examinador_model.dart';
import 'package:http/http.dart' as http;

Future<ExaminadorModel> apiExaminador({required String parametroUrl}) async {
  final url = parametroUrl;
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(utf8.decode(response.bodyBytes));
    return ExaminadorModel.fromJson(responseBody);
  } else {
    throw Exception("Não foi possivel carregar os dados da Api");
  }
}
