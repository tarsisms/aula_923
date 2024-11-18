// DAO - DATA ACCESS OBJECT

import 'package:aula_923/db/db_helper.dart';
import 'package:aula_923/domain/pacote_turistico.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  Future<List<PacoteTuristico>> listarPacotes() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM PACOTE;';

    var result = await db.rawQuery(sql);
    // [
    // { 'id' : 1, 'titulo': 'a' },
    // { 'id' : 2, 'titulo': 'a' },
    // { 'id' : 3, 'titulo': 'a' }
    // ]
    List<PacoteTuristico> lista = [];
    for (var json in result) {
      PacoteTuristico pacote = PacoteTuristico.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }
}
