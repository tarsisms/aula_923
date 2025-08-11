import 'package:aula_923/domain/user.dart';
import 'package:sqflite/sqflite.dart' show Database;

import 'db_helper.dart' show DBHelper;

class UserDao {
  Future<bool> autenticacao(String username, String password) async {
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM USER '
        'WHERE USERNAME = ? '
        'AND PASSWORD = ?;';

    var result = await db.rawQuery(sql, [username, password]);
    print(result);
    return result.isNotEmpty;
  }

  salvar(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
}
