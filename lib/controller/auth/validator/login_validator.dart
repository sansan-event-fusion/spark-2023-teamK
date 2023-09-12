import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginValidatorProvider =
    StateNotifierProvider((ref) => LoginValidator(null));

class LoginValidator extends StateNotifier {
  LoginValidator(super.state);

  bool isEmailValid(String email) {
    final bool isEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return isEmail;
  }

  bool isPasswordValid(String password) {
    final bool isPassword = RegExp(r"^[a-zA-Z0-9]{6,}$").hasMatch(password);
    return isPassword;
  }

  bool isAllValid({required String email, required String password}) {
    if (isEmailValid(email) && isPasswordValid(password)) {
      return true;
    } else {
      return false;
    }
  }
}
