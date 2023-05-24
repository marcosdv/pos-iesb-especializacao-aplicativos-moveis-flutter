import 'package:aula_03_banco_dados/datasources/local/categoria_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static final BancoDados _instance = BancoDados._internal();
  BancoDados._internal();
  factory BancoDados() => _instance;

  Database? _db;

  Future<Database> get db async {
    const nomeBanco = 'meu_cardapio.db';
    final caminho = await getDatabasesPath();
    final caminhoBanco = join(caminho, nomeBanco);

    return await openDatabase(caminhoBanco, version: 1, onCreate: _criarTabelas);
  }

  void _criarTabelas(Database database, int version) async {
    await database.execute(CategoriaHelper.sqlCreate);
    await database.execute('TbProduto');
  }

  void close() {
    _db?.close();
  }
}