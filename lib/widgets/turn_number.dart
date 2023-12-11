import 'package:flutter/material.dart';

class TurnNumber extends StatelessWidget {
  final int number;

  const TurnNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
      child: Text(
        "#${number.toString()}",
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }
}
