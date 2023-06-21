import 'package:aula_03_banco_dados/blocs/lista_categoria_bloc.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:aula_03_banco_dados/ui/pages/cad_categoria_page.dart';
import 'package:aula_03_banco_dados/ui/pages/produtos_page.dart';
import 'package:aula_03_banco_dados/ui/widgets/circulo_espera.dart';
import 'package:aula_03_banco_dados/ui/widgets/item_dismissible.dart';
import 'package:aula_03_banco_dados/ui/widgets/item_lista.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = ListaCategoriaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cardápio')),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add)
      ),
      backgroundColor: const Color(0xFFEEEEEE),
      body: FutureBuilder(
        future: _bloc.getTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              }
              else {
                return _criarLista(snapshot.data!);
              }
          }
        }
      ),
    );
  }

  Widget _criarLista(List<Categoria> lista) {
    return Column(
      children: [
        Image.asset('images/logo.png'),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return ItemDismissible(
                filho: _itemLista(lista[index]),
                dados: [
                  DadosDismissible(
                      titulo: 'Editar Categoria',
                      evento: () { _abrirCadastro(categoria: lista[index]); },
                      corFundo: Colors.green.shade200,
                      alinhamento: Alignment.centerLeft,
                      deveConfirmar: false,
                      direction: DismissDirection.startToEnd
                  ),
                  DadosDismissible(
                      titulo: 'Excluir Categoria',
                      evento: () { _bloc.excluir(lista[index]); },
                      corFundo: Colors.red.shade200,
                      alinhamento: Alignment.centerRight,
                      deveConfirmar: true,
                      txtConfirmar: 'Deseja excluir essa categoria?',
                      direction: DismissDirection.endToStart
                  ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }

  Widget _itemLista(Categoria categoria) {
    return ItemLista(
      filho: Center(child: Text(categoria.nome)),
      clique: () { _abrirProdutos(categoria); },
      cliqueLongo: () { _abrirCadastro(categoria: categoria); },
    );
  }

  void _abrirCadastro({Categoria? categoria}) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => CadCategoriaPage(categoria: categoria,)));

    setState(() { });
  }

  void _abrirProdutos(Categoria categoria) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ProdutosPage(categoria)));
  }
}