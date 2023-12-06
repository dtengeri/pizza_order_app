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

class _PizzaDetailsScreenState extends State<PizzaDetailsScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 12, end: 32).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );
    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Details'),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.pizza.imageAsset,
            child: Image.asset(widget.pizza.imageAsset),
          ),
          Text(widget.pizza.name),
          AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Text(
                  '\$${widget.pizza.price}',
                  style: TextStyle(
                    fontSize: _animation.value,
                    color: _colorAnimation.value,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
