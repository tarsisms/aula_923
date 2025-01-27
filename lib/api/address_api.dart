import 'package:aula_923/domain/address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final domain = 'https://brasilapi.com.br/api';
  final dio = Dio();

  Future<Address> findAddressByCep(String cep) async {
    final response = await dio.get('$domain/cep/v2/$cep');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;
  }
}
