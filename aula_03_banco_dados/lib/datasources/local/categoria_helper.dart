import 'package:aula_03_banco_dados/datasources/local/banco_dados.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:sqflite/sqflite.dart';

class CategoriaHelper {
  static const sqlCreate = '''
    CREATE TABLE IF NOT EXISTS ${Categoria.tabela} (
      ${Categoria.campoCodigo} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Categoria.campoNome} TEXT
    )
  ''';

  void inserir(Categoria categoria) async {
    Database db = await BancoDados().db;

    db.insert(Categoria.tabela, categoria.toMap());
  }

  void alterar(Categoria categoria) async {
    Database db = await BancoDados().db;

    db.update(Categoria.tabela, categoria.toMap(),
      where: '${Categoria.campoCodigo} = ?',
      whereArgs: [ categoria.codigo ]
    );
  }

  void excluir(int codigo) async {
    Database db = await BancoDados().db;

    db.delete(Categoria.tabela,
      where: '${Categoria.campoCodigo} = ?',
      whereArgs: [ codigo ]
    );
  }

  Future<List<Categoria>> getTodos() async {
    await Future.delayed(Duration(seconds: 1));
    Database db = await BancoDados().db;

    var listaDados = await db.query(Categoria.tabela);
    return listaDados.map((e) => Categoria.fromMap(e)).toList();
    /*
    List<Categoria> listaRetorno = [];
    for (int i = 0; i < listaDados.length; i++) {
      listaRetorno.add(Categoria.fromMap(listaDados[i]));
    }
    return listaRetorno;
    */
  }

  Future<Categoria?> getByCodigo(int codigo) async {
    Database db = await BancoDados().db;

    var listaDados = await db.query(Categoria.tabela,
      where: '${Categoria.campoCodigo} = ?',
      whereArgs: [ codigo ]
    );

    if (listaDados.isNotEmpty) {
      return Categoria.fromMap(listaDados.first);
    }

    return null;
  }
}