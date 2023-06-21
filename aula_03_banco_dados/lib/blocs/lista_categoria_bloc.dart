import 'package:aula_03_banco_dados/datasources/local/categoria_helper.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';

class ListaCategoriaBloc {
  final _helper = CategoriaHelper();

  Future<List<Categoria>> getTodos() {
    return _helper.getTodos();
  }

  void excluir(Categoria categoria) {
    _helper.excluir(categoria.codigo ?? 0);
  }
}