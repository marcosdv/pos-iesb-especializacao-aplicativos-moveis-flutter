import 'package:aula_03_banco_dados/ui/widgets/botao_texto.dart';
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
        BotaoTexto(titulo: 'OK', clique: (){ Navigator.pop(context); })
      ]
    );
  }
}