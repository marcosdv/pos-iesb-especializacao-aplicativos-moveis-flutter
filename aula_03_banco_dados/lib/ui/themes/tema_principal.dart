import 'package:flutter/material.dart';

ThemeData carregarTema() {
  const corPrimaria = Color.fromRGBO(52, 2, 133, 1.0);
  const corPrimariaEscura = Color.fromRGBO(37, 0, 95, 1.0);
  const corPrimariaClara = Color.fromRGBO(73, 0, 189, 1.0);

  const appBarTema = AppBarTheme(
    centerTitle: true,
    color: corPrimaria,
  );

  var botaoQuadradoTema = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: corPrimaria,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
    )
  );

  var botaoFlutuanteTema = FloatingActionButtonThemeData(
    backgroundColor: corPrimaria,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
  );

  const campoTextoTema = InputDecorationTheme(
    //border: OutlineInputBorder()
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: corPrimariaEscura, width: 1)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: corPrimariaClara, width: 2)),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  );

  return ThemeData(
    primaryColor: corPrimaria,
    primaryColorDark: corPrimariaEscura,
    primaryColorLight: corPrimariaClara,
    appBarTheme: appBarTema,
    elevatedButtonTheme: botaoQuadradoTema,
    floatingActionButtonTheme: botaoFlutuanteTema,
    inputDecorationTheme: campoTextoTema
  );
}