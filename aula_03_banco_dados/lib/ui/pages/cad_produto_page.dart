import 'package:aula_03_banco_dados/blocs/cad_produto_bloc.dart';
import 'package:aula_03_banco_dados/models/models.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_icone.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_texto.dart';
import 'package:aula_03_banco_dados/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadProdutoPage extends StatefulWidget {
  final Categoria categoria;
  final Produto? produto;

  const CadProdutoPage({required this.categoria, this.produto, super.key});

  @override
  State<CadProdutoPage> createState() => _CadProdutoPageState();
}

class _CadProdutoPageState extends State<CadProdutoPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = CadProdutoBloc(context: context, categoria: widget.categoria, produto: widget.produto);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de produtos'),
        actions: [ _criarBotaoExcluir(bloc) ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.salvar,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CampoTexto(
              controller: bloc.nomeController,
              texto: 'Nome:'
            ),
            CampoTexto(
              controller: bloc.precoController,
              texto: 'Preço:',
              prefixo: 'R\$ ',
              teclado: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  Widget _criarBotaoExcluir(CadProdutoBloc bloc) {
    if (bloc.emEdicao) {
      return BotaoIcone(
        clique: bloc.excluir,
        icone: Icons.delete_forever,
        cor: Colors.white,
      );
    }
    return const SizedBox();
  }
}