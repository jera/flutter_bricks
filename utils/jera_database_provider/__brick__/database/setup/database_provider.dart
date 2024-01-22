import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../table/table.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static DatabaseProvider instance = DatabaseProvider._();

  late Database _db;

  bool _isInitialized = false;

  //TODO adicione suas tabelas aqui
  final tables = <Table>[];

  Database get db {
    if (!_isInitialized) {
      throw Exception('Database not initialized');
    }

    return _db;
  }

  Future<void> initialize() async {
    final databasesPath = await getDatabasesPath();

    //TODO alterar o nome do path do banco de dados
    final path = join(databasesPath, 'nome_do_seu_projeto.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        final batch = db.batch();

        for (final table in tables) {
          batch.execute(table.create);
        }

        await batch.commit();
      },
    );

    _isInitialized = true;
  }

  Future<void> clearTables() async {
    if (!_isInitialized) {
      return throw Exception('Database not initialized');
    }
    final tables = await _db.rawQuery('''
          SELECT name FROM sqlite_master
              WHERE type = ?''', ['table']);

    final batch = db.batch();

    for (final table in tables) {
      batch.delete(table['name'] as String);
    }

    await batch.commit(noResult: true);
  }
}
