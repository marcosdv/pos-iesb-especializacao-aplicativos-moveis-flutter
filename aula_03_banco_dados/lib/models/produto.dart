import 'package:aula_03_banco_dados/models/models.dart';

class Produto {
  int codigo;
  String nome;
  double preco;
  Categoria categoria;

  Produto(this.codigo, this.nome, this.preco, this.categoria);
}