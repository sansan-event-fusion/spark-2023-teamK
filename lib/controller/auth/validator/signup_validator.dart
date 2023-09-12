import 'package:hooks_riverpod/hooks_riverpod.dart';

final signupValidatorProvider =
    StateNotifierProvider((ref) => SignupValidator(null));

class SignupValidator extends StateNotifier {
  SignupValidator(super.state);

  bool isNameValid(String name) {
    final bool isName = name != "";
    return isName;
  }

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

  bool isAllValid(
      {required String name, required String email, required String password}) {
    if (isNameValid(name) && isEmailValid(email) && isPasswordValid(password)) {
      return true;
    } else {
      return false;
    }
  }
}
