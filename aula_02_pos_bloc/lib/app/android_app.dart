import 'package:aula02_pos_bloc/constantes.dart';
import 'package:aula02_pos_bloc/ui/android/home_page.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Constantes.tituloApp,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}