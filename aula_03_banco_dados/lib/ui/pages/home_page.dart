import 'package:aula_03_banco_dados/blocs/lista_categoria_bloc.dart';
import 'package:aula_03_banco_dados/models/categoria.dart';
import 'package:aula_03_banco_dados/ui/widgets/circulo_espera.dart';
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
      appBar: AppBar(title: const Text('Cardápio'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Icon(Icons.add),
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
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return _itemLista(lista[index]);
      }
    );
  }

  Widget _itemLista(Categoria categoria) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(child: Text(categoria.nome)),
      ),
    );
  }
}