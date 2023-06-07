import 'package:aula_03_banco_dados/extensions/string_extension.dart';

class Categoria {
  static const tabela = 'TbCategoria';
  static const campoCodigo = 'codigo';
  static const campoNome = 'nome';

  int? codigo;
  String nome;

  Categoria({this.codigo, required this.nome});

  factory Categoria.fromMap(Map dados) {
    return Categoria(
      codigo: dados[campoCodigo].toString().toInt(),
      nome: dados[campoNome]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      campoCodigo: codigo,
      campoNome: nome
    };
  }
}