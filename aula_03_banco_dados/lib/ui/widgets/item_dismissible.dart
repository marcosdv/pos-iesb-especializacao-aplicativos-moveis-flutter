import 'package:aula_03_banco_dados/ui/widgets/botao_quadrado.dart';
import 'package:aula_03_banco_dados/ui/widgets/botao_texto.dart';
import 'package:aula_03_banco_dados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class DadosDismissible {
  final String titulo;
  final Alignment? alinhamento;
  final Color? corFundo;
  final VoidCallback evento;
  final String? txtConfirmar;
  final bool deveConfirmar;
  final DismissDirection direction;

  DadosDismissible({
    required this.titulo,
    this.alinhamento,
    this.corFundo,
    required this.evento,
    required this.deveConfirmar,
    this.txtConfirmar,
    required this.direction
  });
}

class ItemDismissible extends StatelessWidget {
  final Widget filho;
  final List<DadosDismissible> dados;

  const ItemDismissible({required this.filho, required this.dados, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        background: _criarContainer(0),
        secondaryBackground: _criarContainer(1),
        onDismissed: _eventoDismissed,
        confirmDismiss: (d) => _eventoConfirmDismiss(context, d),
        child: filho
    );
  }

  void _eventoDismissed(DismissDirection direction) {
    if (dados.isNotEmpty) {
      if (direction == dados[0].direction) {
        dados[0].evento();
      }
    }

    if (dados.length > 1) {
      if (direction == dados[1].direction) {
        dados[1].evento();
      }
    }
  }

  Future<bool> _eventoConfirmDismiss(BuildContext context, DismissDirection direction) async {
    if (dados.isNotEmpty) {
      if (dados[0].deveConfirmar && direction == dados[0].direction) {
        return _mostrarMensagem(context, dados[0]);
      }
    }

    if (dados.length > 1) {
      if (dados[1].deveConfirmar && direction == dados[1].direction) {
        return _mostrarMensagem(context, dados[1]);
      }
    }

    return true;
  }

  Future<bool> _mostrarMensagem(BuildContext context, DadosDismissible dados) async {
    return await MensagemPopup().show(
      context: context,
      titulo: 'Atenção',
      texto: dados.txtConfirmar ?? '',
      botoes: [
        BotaoTexto(titulo: 'Sim', cor: Colors.red, clique: () {
          Navigator.of(context).pop(true);
        }),
        BotaoQuadrado(titulo: 'Não', tamanho: 50, clique: () {
          Navigator.of(context).pop(false);
        }),
      ]
    );
  }

  Widget? _criarContainer(int indice) {
    if (dados.length > indice) {
      return Container(
        alignment: dados[indice].alinhamento,
        color: dados[indice].corFundo,
        child: Text(dados[indice].titulo),
      );
    }
    return null;
  }
}
