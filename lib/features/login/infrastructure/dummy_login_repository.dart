import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/login/domain/login_repository.dart';

class DummyLoginRepository extends LoginRepository {
  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    return User(name: 'John Doe', email: email);
  }
}
