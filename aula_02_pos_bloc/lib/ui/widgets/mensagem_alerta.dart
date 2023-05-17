import 'package:aula02_pos_bloc/ui/widgets/botao_texto.dart';
import 'package:flutter/widgets.dart';

class MensagemAlerta {
  void show({
    required BuildContext context,
    required String titulo,
    required String texto
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 200,
          padding: const EdgeInsets.all(20),
            color: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(titulo, style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 24),
                  child: Text(texto, style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  )),
                ),
                BotaoTexto(texto: 'Ok', clique: () { Navigator.pop(context); }),
              ],
            ),
          ),
        );
      }
    );
  }
}