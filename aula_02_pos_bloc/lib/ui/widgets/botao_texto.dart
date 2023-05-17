import 'package:flutter/widgets.dart';

class BotaoTexto extends StatelessWidget {
  final String texto;
  final VoidCallback? clique;

  const BotaoTexto({
    required this.texto,
    required this.clique,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clique,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(texto, style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          color: Color(0xFF007AFF),
          ),
        ),
      ),
    );
  }
}