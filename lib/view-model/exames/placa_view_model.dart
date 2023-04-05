import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/exames/placa_model.dart';
import '../../widgets/custom_url_mock.dart';


class PlacaViewModel {

  Future<PlacaModel> achaPlaca() async {
    String url = "${UrlMock.urlCariatte}/exames/placa";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PlacaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
