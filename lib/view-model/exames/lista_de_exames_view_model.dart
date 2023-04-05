import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/exames/lista_de_exames_model.dart';
import '../../widgets/custom_url_mock.dart';

class ListaExamesViewModel {

  Future<ExamesModel> listaDeExames() async{
    String url = "${UrlMock.urlCariatte}/exames";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      return ExamesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro');
    }
  }

}