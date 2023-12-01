import 'package:flutter/material.dart';
import 'package:pizza_order_app/features/pizza_order/domain/pizza.dart';

class PizzaDetailsScreen extends StatefulWidget {
  const PizzaDetailsScreen({
    super.key,
    required this.pizza,
  });

  final Pizza pizza;

  @override
  State<PizzaDetailsScreen> createState() => _PizzaDetailsScreenState();
}

class _PizzaDetailsScreenState extends State<PizzaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Details'),
      ),
      body: Column(
        children: [
          Image.asset(widget.pizza.imageAsset),
          Text(widget.pizza.name),
          Text(
            '\$${widget.pizza.price}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
