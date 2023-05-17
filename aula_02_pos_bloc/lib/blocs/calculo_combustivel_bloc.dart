import 'package:aula02_pos_bloc/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/widgets.dart';

class CalculoCombustivelBloc {
  final BuildContext context;
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();

  CalculoCombustivelBloc(this.context);

  void calcular() {
    final valorEtanol = double.parse(etanolController.text);
    final valorGasolina = double.parse(gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Etanol',
        texto: 'Abasteça com Etanol, é melhor'
      );
    }
    else {
      MensagemAlerta().show(
          context: context,
          titulo: 'Gasolina',
          texto: 'Abasteça com Gasolina, é melhor'
      );
    }
  }
}