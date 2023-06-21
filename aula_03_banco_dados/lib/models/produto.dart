import 'package:aula_03_banco_dados/extensions/string_extension.dart';
import 'package:aula_03_banco_dados/models/models.dart';

class Produto {
  static const tabela = 'TbProduto';
  static const campoCodigo = 'codigo';
  static const campoNome = 'nome';
  static const campoPreco = 'preco';
  static const campoCategoria = 'categoria';

  int? codigo;
  String nome;
  double preco;
  Categoria categoria;

  Produto({
    this.codigo,
    required this.nome,
    required this.preco,
    required this.categoria
  });

  factory Produto.fromMap(Map dados, Categoria categoria) {
    return Produto(
      codigo: dados[campoCodigo].toString().toInt(),
      nome: dados[campoNome],
      preco: dados[campoPreco].toString().toDouble(),
      categoria: categoria
    );
  }

  Map<String, dynamic> toMap() {
    return {
      campoCodigo: codigo,
      campoNome: nome,
      campoPreco: preco,
      campoCategoria: categoria.codigo
    };
  }
}