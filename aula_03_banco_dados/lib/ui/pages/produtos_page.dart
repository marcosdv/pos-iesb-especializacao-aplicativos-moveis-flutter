import 'package:aula_03_banco_dados/blocs/lista_produto_bloc.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:aula_03_banco_dados/models/models.dart';
import 'package:aula_03_banco_dados/ui/pages/cad_produto_page.dart';
import 'package:aula_03_banco_dados/ui/widgets/circulo_espera.dart';
import 'package:aula_03_banco_dados/ui/widgets/item_dismissible.dart';
import 'package:aula_03_banco_dados/ui/widgets/item_lista.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  final Categoria categoria;

  const ProdutosPage(this.categoria, {super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final _bloc = ListaProdutoBloc();

  @override
  Widget build(BuildContext context) {
    var categoria = widget.categoria;

    return Scaffold(
      appBar: AppBar(title: Text(categoria.nome)),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _bloc.getTodosPorCategoria(categoria),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              }
              return _criarLista(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _criarLista(List<Produto> lista) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return ItemDismissible(
          filho: _criarItemLista(lista[index]),
          dados: [
            DadosDismissible(
              titulo: 'Editar Produto',
              evento: () { _abrirCadastro(produto: lista[index]); },
              deveConfirmar: false,
              direction: DismissDirection.startToEnd,
              corFundo: Colors.green.shade200,
              alinhamento: Alignment.centerLeft,
            ),
            DadosDismissible(
              titulo: 'Excluir Produto',
              evento: () { _bloc.excluir(lista[index]); },
              deveConfirmar: true,
              direction: DismissDirection.endToStart,
              corFundo: Colors.red.shade200,
              alinhamento: Alignment.centerRight,
              txtConfirmar: 'Deseja excluir esse produto?'
            ),
          ]
        );
      },
    );
  }

  Widget _criarItemLista(Produto produto) {
    return ItemLista(
      filho: Row(
        children: [
          Expanded(child: Text(produto.nome)),
          Text('R\$ ${produto.preco.toStringAsFixed(2)}')
        ],
      ),
      clique: () { _abrirCadastro(produto: produto); },
    );
  }

  void _abrirCadastro({Produto? produto}) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) =>
      CadProdutoPage(categoria: widget.categoria, produto: produto)));

    setState(() { });
  }
}