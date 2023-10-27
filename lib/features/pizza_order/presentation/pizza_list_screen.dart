import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/pizza_order/application/pizza_list.dart';

class PizzaListScreen extends ConsumerWidget {
  const PizzaListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pizzas = ref.watch(pizzaListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Order'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome!'),
          Expanded(
            child: ListView.separated(
              itemCount: pizzas.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(pizzas[index].name),
                trailing: Text(
                  '\$${pizzas[index].price}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
