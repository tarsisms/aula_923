import 'package:aula_923/domain/propriedade.dart';
import 'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake_api';

  Future<List<Propriedade>> listarPropriedades() async {
    final response = await dio.get('$baseUrl/propriedades');

    // Percorrer a lista de elementos
    List<Propriedade> listaPropriedades = [];
    for (var json in response.data) {
      // Criar a Propriedade usando NamedConstructor
      Propriedade propriedade = Propriedade.fromJson(json);

      // Add Propriedade na Lista
      listaPropriedades.add(propriedade);
    }

    await Future.delayed(Duration(seconds: 5));
    return listaPropriedades;
  }
}
