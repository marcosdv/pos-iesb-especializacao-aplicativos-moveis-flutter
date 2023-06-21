import 'package:aula_03_banco_dados/ui/pages/home_page.dart';
import 'package:aula_03_banco_dados/ui/themes/tema_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Meu Cardápio',
    home: const HomePage(),
    theme: carregarTema(),
    debugShowCheckedModeBanner: false,
  ));
}