import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pizza_order_app/features/auth/domain/auth_repository.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/auth/infrastructure/providers.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/profile/infrastructure/dummy_profile_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/providers.dart';
import 'package:pizza_order_app/features/profile/presentation/profile_screen.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('ProfileScreen', () {
    final mockAuthRepository = MockAuthRepository();
    when(() => mockAuthRepository.watch()).thenAnswer(
      (_) => Stream.value(
        Authenticated(
          user: User(uid: '1', name: 'John Doe', email: 'test@example.com'),
        ),
      ),
    );
    testWidgets('shows phone number', (widgetTester) async {
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: [
            profileRepositoryProvider
                .overrideWith((ref) => DummyProfileRepository()),
            authRepositoryProvider.overrideWith((ref) => mockAuthRepository),
          ],
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );
      await widgetTester.pump();
      await widgetTester.pump();
      expect(find.text('+36301234567'), findsOneWidget);
    });

    testWidgets('opens add address dialog', (widgetTester) async {
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: [
            profileRepositoryProvider
                .overrideWith((ref) => DummyProfileRepository()),
            authRepositoryProvider.overrideWith((ref) => mockAuthRepository),
          ],
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );
      await widgetTester.pump();
      await widgetTester.pump();

      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pump();
      expect(find.text('Add new delivery address'), findsOneWidget);
    });
  });
}
