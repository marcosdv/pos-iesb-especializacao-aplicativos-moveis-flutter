import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  final Widget filho;
  final VoidCallback? clique;
  final VoidCallback? cliqueLongo;
  final double margemVertical;
  final double margemHorizontal;

  const ItemLista({
    required this.filho,
    this.clique,
    this.cliqueLongo,
    this.margemVertical = 12,
    this.margemHorizontal = 12,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clique,
      onLongPress: cliqueLongo,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margemHorizontal, vertical: margemVertical),
          child: filho,
        ),
      ),
    );
  }
}