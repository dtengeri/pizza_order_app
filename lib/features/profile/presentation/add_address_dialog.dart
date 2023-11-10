import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';

class AddAddressDialog extends StatefulWidget {
  const AddAddressDialog({super.key});

  @override
  State<AddAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  final _cityTextEditingController = TextEditingController();
  final _streetTextEditingController = TextEditingController();
  final _houseNumberTextEditingController = TextEditingController();

  void _close() {
    context.pop();
  }

  void _add() {
    context.pop(
      DeliveryAddress(
        city: _cityTextEditingController.text,
        street: _streetTextEditingController.text,
        houseNumber: _houseNumberTextEditingController.text,
      ),
    );
  }

  @override
  void dispose() {
    _cityTextEditingController.dispose();
    _streetTextEditingController.dispose();
    _houseNumberTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new delivery address'),
      actions: [
        TextButton(
          onPressed: _close,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _add,
          child: const Text('Add'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _cityTextEditingController,
            decoration: const InputDecoration(
              labelText: 'City',
            ),
          ),
          TextField(
            controller: _streetTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Street',
            ),
          ),
          TextField(
            controller: _houseNumberTextEditingController,
            decoration: const InputDecoration(
              labelText: 'House number',
            ),
          ),
        ],
      ),
    );
  }
}
