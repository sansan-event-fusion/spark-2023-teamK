import 'package:hooks_riverpod/hooks_riverpod.dart';

final userSettingValidatorProvider =
    StateNotifierProvider((ref) => UserSettingValidator(null));

class UserSettingValidator extends StateNotifier {
  UserSettingValidator(super.state);

  bool isNameValid(String name) {
    final bool isName = name != "";
    return isName;
  }

  bool isUserIdValid(String userId) {
    final bool isUserId = RegExp(r"^[a-zA-Z0-9]{6,}$").hasMatch(userId);
    return isUserId;
  }

  bool isAllValid(
      {required String name, required String userId}) {
    if (isNameValid(name) && isUserIdValid(userId)) {
      return true;
    } else {
      return false;
    }
  }
}
