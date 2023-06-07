import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final VoidCallback clique;
  final String? titulo;
  final IconData? icone;
  final double tamanho;
  final Color? cor;

  const BotaoQuadrado({
    required this.clique,
    this.titulo,
    this.icone,
    this.tamanho = 100,
    this.cor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      style: ElevatedButton.styleFrom(backgroundColor: cor),
      child: SizedBox(
        width: tamanho,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icone != null ? Icon(icone!) : const SizedBox(),
            Text(titulo ?? ''),
          ],
        ),
      ),
    );
  }
}