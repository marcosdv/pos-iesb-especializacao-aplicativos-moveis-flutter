import 'package:aula_03_banco_dados/datasources/local/produto_helper.dart';
import 'package:aula_03_banco_dados/extensions/string_extension.dart';
import 'package:aula_03_banco_dados/models/models.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_texto.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_alerta.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class CadProdutoBloc {
  final BuildContext context;
  final Categoria categoria;
  final Produto? produto;

  CadProdutoBloc({required this.context, required this.categoria, this.produto}) {
    if (emEdicao) {
      nomeController.text = produto!.nome;
      precoController.text = produto!.preco.toString();
    }
  }

  final _helper = ProdutoHelper();
  final nomeController = TextEditingController();
  final precoController = TextEditingController();

  bool get emEdicao => produto != null;

  void salvar() {
    if (nomeController.text.trim().isEmpty) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'O Nome é obrigatório!'
      );
      return;
    }
    if (precoController.text.toDouble() <= 0) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'O Preço deve ser maior que zero!'
      );
      return;
    }

    final prod = Produto(
      nome: nomeController.text,
      preco: precoController.text.toDouble(),
      categoria: categoria
    );

    if (emEdicao) {
      prod.codigo = produto!.codigo;
      _helper.alterar(prod);
    }
    else {
      _helper.inserir(prod);
    }

    Navigator.pop(context);
  }

  void excluir() {
    MensagemPopup().show(
      context: context,
      titulo: 'Atenção',
      texto: 'Deseja excluir esse produto?',
      botoes: [
        BotaoTexto(titulo: 'Sim', cor: Colors.red, clique: _confirmarExclusao),
        BotaoQuadrado(titulo: 'Não', tamanho: 50, clique: () { Navigator.pop(context); }),
      ]
    );
  }

  void _confirmarExclusao() {
    if (emEdicao) {
      _helper.excluir(produto!.codigo ?? 0);
    }
    Navigator.pop(context); //Fecha a mensagem de alerta/pergunta
    Navigator.pop(context); //Fecha a tela apos excluir
  }
}