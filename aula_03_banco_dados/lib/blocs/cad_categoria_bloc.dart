import 'package:aula_03_banco_dados/datasources/local/categoria_helper.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_texto.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_alerta.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class CadCategoriaBloc {
  final _helper = CategoriaHelper();
  final nomeController = TextEditingController();

  final BuildContext context;
  final Categoria? categoria;

  CadCategoriaBloc(this.context, this.categoria) {
    if (categoria != null) {
      nomeController.text = categoria!.nome;
    }
  }

  void salvar() {
    if (nomeController.text.trim().isEmpty) {
      MensagemAlerta().show(context: context, titulo: 'Atenção',
        texto: 'Nome da categoria é obrigatório!');
      return;
    }

    final cat = Categoria(nome: nomeController.text);

    if (categoria == null) {
      _helper.inserir(cat);
    }
    else {
      cat.codigo = categoria!.codigo;
      _helper.alterar(cat);
    }

    //fechar a tela de cadastro de categorias
    Navigator.pop(context);
  }

  void excluir() {
    MensagemPopup().show(
      context: context,
      titulo: 'Atenção',
      texto: 'Deseja excluir essa categoria?',
      botoes: [
        BotaoTexto(titulo: 'Sim', cor: Colors.red, clique: _confirmarExclusao),
        BotaoQuadrado(titulo: 'Não', tamanho: 50, clique: () { Navigator.pop(context); }),
      ]
    );
  }

  void _confirmarExclusao() {
    if (categoria != null) {
      _helper.excluir(categoria!.codigo ?? 0);

      Navigator.pop(context); //fechar a mensagem de alerta aberta
      Navigator.pop(context); //fechar a tela de cadastro de categorias
    }
  }
}