import 'package:aula_03_banco_dados/datasources/local/banco_dados.dart';
import 'package:aula_03_banco_dados/datasources/local/categoria_helper.dart';
import 'package:aula_03_banco_dados/models/models.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoHelper {
  static const sqlCreate = '''
    CREATE TABLE IF NOT EXISTS ${Produto.tabela} (
      ${Produto.campoCodigo} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Produto.campoNome} TEXT,
      ${Produto.campoPreco} REAL,
      ${Produto.campoCategoria} INTEGER,
      FOREING KEY ${Produto.campoCategoria} REFERENCES ${Categoria.tabela} (${Categoria.campoCodigo})
    )
  ''';

  void inserir(Produto produto) async {
    Database db = await BancoDados().db;

    //ORM (Object Relational Mapper) - auxilia na criacao de comando SQL
    //db.rawInsert('INSERT INTO TbProduto ...');
    db.insert(Produto.tabela, produto.toMap());
  }

  void alterar(Produto produto) async {
    Database db = await BancoDados().db;

    db.update(
      Produto.tabela,
      produto.toMap(),
      where: '${Produto.campoCodigo} = ? AND ${Produto.campoCategoria} = ?',
      whereArgs: [ produto.codigo, produto.categoria ]
    );
  }

  void excluir(int codigo) async {
    Database db = await BancoDados().db;

    db.delete(Produto.tabela, where: '${Produto.campoCodigo} = ?', whereArgs: [ codigo ]);
  }

  Future<List<Produto>> getTodosPorCategoria(int codCategoria) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var categoria = await CategoriaHelper().getByCodigo(codCategoria);

    if (categoria != null) {
      Database db = await BancoDados().db;

      var listaDados = await db.query(
          Produto.tabela,
          where: '${Produto.campoCategoria} = ?',
          whereArgs: [ codCategoria]
      );

      return listaDados.map((e) => Produto.fromMap(e, categoria)).toList();
    }

    return []; //retorna um List<Produto> vazio
  }
}