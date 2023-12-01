import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pizza_order_app/features/auth/domain/auth_repository.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/auth/infrastructure/providers.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/profile/application/profile_controller.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';
import 'package:pizza_order_app/features/profile/infrastructure/dummy_profile_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/providers.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('ProfileController', () {
    final mockAuthRepository = MockAuthRepository();

    test('should return empty profile when user is unknown', () async {
      final container = createContainer(overrides: [
        profileRepositoryProvider
            .overrideWith((ref) => DummyProfileRepository()),
        authRepositoryProvider.overrideWith((ref) => mockAuthRepository),
      ]);

      when(() => mockAuthRepository.watch())
          .thenAnswer((_) => Stream.value(const Unknown()));

      await expectLater(
        container.read(profileControllerProvider.future),
        completion(
          const UserProfile(
            uid: '',
            phone: '',
            addresses: [],
          ),
        ),
      );
    });
    test('should return empty profile when user is unauthenticated', () async {
      final container = createContainer(overrides: [
        profileRepositoryProvider
            .overrideWith((ref) => DummyProfileRepository()),
        authRepositoryProvider.overrideWith((ref) => mockAuthRepository),
      ]);
      when(() => mockAuthRepository.watch())
          .thenAnswer((_) => Stream.value(const Unauthenticated()));

      final subscription =
          container.listen(profileControllerProvider, (_, __) {});

      await expectLater(
        container.read(profileControllerProvider.future),
        completion(
          const UserProfile(
            uid: '',
            phone: '',
            addresses: [],
          ),
        ),
      );
    });

    test('should return user profile when user is authenticated', () async {
      final container = createContainer(overrides: [
        profileRepositoryProvider
            .overrideWith((ref) => DummyProfileRepository()),
        authRepositoryProvider.overrideWith((ref) => mockAuthRepository),
      ]);
      when(() => mockAuthRepository.watch()).thenAnswer(
        (_) => Stream.value(
          Authenticated(
            user: User(uid: '1', name: 'John Doe', email: 'test@example.com'),
          ),
        ),
      );

      final subscription =
          container.listen(profileControllerProvider, (_, __) {});

      await expectLater(
        container.read(profileControllerProvider.future),
        completion(
          const UserProfile(
            uid: '1',
            phone: '+36301234567',
            addresses: [
              DeliveryAddress(
                city: 'Szeged',
                street: 'Kossuth Lajos sgt.',
                houseNumber: '84',
                coordinates: LatLng(46.253010, 20.141425),
              ),
            ],
          ),
        ),
      );
    });
  });
}
