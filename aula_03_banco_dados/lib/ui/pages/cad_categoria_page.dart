import 'package:aula_03_banco_dados/blocs/cad_categoria_bloc.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadCategoriaPage extends StatefulWidget {
  final Categoria? categoria;

  const CadCategoriaPage({this.categoria, super.key});

  @override
  State<CadCategoriaPage> createState() => _CadCategoriaPageState();
}

class _CadCategoriaPageState extends State<CadCategoriaPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = CadCategoriaBloc(context, widget.categoria);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Categorias'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CampoTexto(
              controller: bloc.nomeController,
              texto: 'Nome da Categoria'
            ),
            BotaoQuadrado(
              clique: bloc.salvar,
              titulo: 'Salvar',
              icone: Icons.save,
              cor: Colors.green.shade700,
            ),
            _criarBotaoExcluir(bloc),
          ],
        ),
      ),
    );
  }

  Widget _criarBotaoExcluir(CadCategoriaBloc bloc) {
    if (widget.categoria != null) {
      return BotaoQuadrado(
        clique: bloc.excluir,
        titulo: 'Excluir',
        icone: Icons.delete_forever_outlined,
        cor: Colors.red.shade700,
      );
    }
    return const SizedBox();
  }
}