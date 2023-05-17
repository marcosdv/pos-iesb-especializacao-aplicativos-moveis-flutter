import 'package:aula02_pos_bloc/constantes.dart';
import 'package:aula02_pos_bloc/ui/ios/home_page.dart';
import 'package:flutter/cupertino.dart';

class IosApp extends StatelessWidget {
  const IosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: Constantes.tituloApp,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}