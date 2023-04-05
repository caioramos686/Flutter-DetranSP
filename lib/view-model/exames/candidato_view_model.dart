import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/exames/candidato_model.dart';
import '../../widgets/custom_url_mock.dart';


class CandidatoViewModel {

  Future<CandidatoModel> achaCpf({required String cpf}) async{
    String url = "${UrlMock.urlCariatte}/exames/$cpf";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      return CandidatoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro');
    }
  }

}