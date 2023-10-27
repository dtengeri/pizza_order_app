import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/pizza_order/domain/pizza.dart';

final pizzaListProvider = Provider<List<Pizza>>(
  (ref) => [
    const Pizza(name: 'Domino', price: 11.2),
    const Pizza(name: 'Pizza Ruccola', price: 14.9),
    const Pizza(name: 'Pizza Salami', price: 10.8),
    const Pizza(name: 'Pizza Sushi', price: 15.7),
    const Pizza(name: 'Pepperoni', price: 14.9),
  ],
);
