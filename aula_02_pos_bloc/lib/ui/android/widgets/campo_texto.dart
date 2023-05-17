import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final TextInputType teclado;
  final TextEditingController controlador;

  const CampoTexto({
    required this.controlador,
    required this.texto,
    this.teclado = TextInputType.number,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controlador,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
        ),
      ),
    );
  }
}
