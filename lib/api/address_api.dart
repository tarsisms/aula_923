import 'package:aula_923/domain/Address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();
  String baseUrl = 'https://brasilapi.com.br/api';

  Future<Address> findByCep(String cep) async {
    var result = await dio.get('$baseUrl/cep/v2/$cep');

    //if (result.statusCode == 200) {
    var json = result.data;
    Address address = Address.fromJson(json);
    return address;
    //}
  }
}
