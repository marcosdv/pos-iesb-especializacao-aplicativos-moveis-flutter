import 'package:aula_03_banco_dados/datasources/local/produto_helper.dart';
import 'package:aula_03_banco_dados/models/models.dart';

class ListaProdutoBloc {
  final _helper = ProdutoHelper();

  Future<List<Produto>> getTodosPorCategoria(Categoria categoria) {
    return _helper.getTodosPorCategoria(categoria.codigo ?? 0);
  }

  void excluir(Produto produto) {
    _helper.excluir(produto.codigo ?? 0);
  }
}