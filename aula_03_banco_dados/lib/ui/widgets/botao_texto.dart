import 'package:flutter/material.dart';

class BotaoTexto extends StatelessWidget {
  final String titulo;
  final VoidCallback clique;
  final Color? cor;

  const BotaoTexto({required this.titulo, required this.clique, this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clique,
      style: TextButton.styleFrom(foregroundColor: cor),
      child: Text(titulo)
    );
  }
}