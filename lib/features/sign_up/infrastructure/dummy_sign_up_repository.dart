import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_form.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_repository.dart';

class DummySignUpRepository extends SignUpRepository {
  @override
  Future<User> signUp({required SignUpForm signUpForm}) async {
    return User(
      uid: '1',
      name: signUpForm.name,
      email: signUpForm.email,
    );
  }
}
