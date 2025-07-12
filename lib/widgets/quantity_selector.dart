import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantitySelector({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onDecrease,
          icon: Icon(Icons.remove_circle_outline),
        ),
        Text(
          quantity.toString(),
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          onPressed: onIncrease,
          icon: Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}
