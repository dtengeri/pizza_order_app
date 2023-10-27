import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/login/presentation/login_screen.dart';
import 'package:pizza_order_app/features/pizza_order/presentation/pizza_list_screen.dart';
import 'package:pizza_order_app/features/profile/presentation/profile_screen.dart';
import 'package:pizza_order_app/features/sign_up/presentation/sign_up_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/pizzas',
      builder: (context, state) => const PizzaListScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
