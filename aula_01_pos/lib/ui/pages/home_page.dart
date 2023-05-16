import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textoController = TextEditingController();
  var _textoOla = 'Sejam bem vindos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App - Aula 01'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cliqueBotao,
        backgroundColor: Colors.blue.shade800,
        child: const Icon(Icons.add, color: Color(0xFFFFC100)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Relou Uordi!!!'),
          Text(_textoOla),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(controller: _textoController,),
          ),

          ElevatedButton(
            onPressed: _cliqueBotao,
            child: const Text('OK')
          ),
        ],
      ),
    );
  }

  void _cliqueBotao() {
    setState(() {
      _textoOla = 'Seja bem vindo ${_textoController.text}';
    });
  }
}