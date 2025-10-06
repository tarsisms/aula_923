import 'package:dio/dio.dart';

import '../domain/propriedade.dart';

class PropriedadesApi {
  final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake-api';

  Future<List<Propriedade>> findAll() async {
    List<Propriedade> listaPropriedades = [];
    // Database db = await DBHelper().initDB();
    // String sql = 'SELECT * FROM PROPRIEDADE;';
    // var listResult = await db.rawQuery(sql);

    final response = await dio.get('$baseUrl/properties');

    if (response.statusCode == 200) {
      var listResult = response.data;
      print(listResult);
      for (var json in listResult) {
        Propriedade propriedade = Propriedade.fromJson(json);
        listaPropriedades.add(propriedade);
      }
    }

    await Future.delayed(Duration(seconds: 3));

    return listaPropriedades;
  }
}
