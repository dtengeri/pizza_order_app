import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_order_app/features/core/domain/user.dart' as core;
import 'package:pizza_order_app/features/sign_up/domain/sign_up_form.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_repository.dart';

class FirebaseSignUpRepository extends SignUpRepository {
  @override
  Future<core.User> signUp({required SignUpForm signUpForm}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpForm.email,
      password: signUpForm.password,
    );
    await credential.user?.updateDisplayName(signUpForm.name);
    return core.User(
      uid: credential.user!.uid,
      name: signUpForm.name,
      email: signUpForm.email,
    );
  }
}
