import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_form.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_repository.dart';
import 'package:pizza_order_app/features/sign_up/infrastructure/dummy_sign_up_repository.dart';

class SignUpController {
  final SignUpRepository _signUpRepository = DummySignUpRepository();

  final SignUpForm _signUpForm = SignUpForm(
    email: '',
    password: '',
    confirmPassword: '',
  );

  SignUpForm get signUpForm => _signUpForm;

  void updateEmail(String email) {
    _signUpForm.email = email;
  }

  void updatePassword(String password) {
    _signUpForm.password = password;
  }

  void updateConfirmPassword(String confirmPassword) {
    _signUpForm.confirmPassword = confirmPassword;
  }

  Future<User> signUp() async {
    if (!_signUpForm.isValid) {
      throw Exception('Invalid form');
    }
    return _signUpRepository.signUp(
      signUpForm: _signUpForm,
    );
  }
}
