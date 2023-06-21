import 'package:flutter/material.dart';

class BotaoIcone extends StatelessWidget {
  final IconData icone;
  final VoidCallback clique;
  final Color? cor;

  const BotaoIcone({required this.icone, required this.clique, this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: clique,
      icon: Icon(icone),
      color: cor,
    );
  }
}