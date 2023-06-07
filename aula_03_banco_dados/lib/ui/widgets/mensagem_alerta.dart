import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  show({
    required BuildContext context,
    required String titulo,
    required String texto
  }) {
    MensagemPopup().show(context: context, titulo: titulo, texto: texto,
      botoes: [
        BotaoQuadrado(titulo: 'OK', tamanho: 50, clique: (){ Navigator.pop(context); })
      ]
    );
  }
}