enum InputType { text, email, number, telephone, password }

class InputValidator {
  const InputValidator();

  static bool validate(type, String value) {
    if (type.runtimeType == InputType) {
      switch (type as InputType) {
        case InputType.email:
          return _validateEmail(value);
        case InputType.telephone:
          return _validatePhoneNumber(value);
        case InputType.password :
          return _validatePassword(value);
        default:
          return true;
      }
    }
    return false;
  }

  static bool _validateEmail(String value) {
    var emailRegExp =
        RegExp(r'(^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$)');
    return emailRegExp.hasMatch(value);
  }

  static bool _validatePhoneNumber(String value) {
    // var telRegExp =
    //     RegExp(r'(^(1\s?)?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{4}$)');
    return value.trim().length >= 8;
  }

   static bool _validatePassword(String value) {
    return value.trim().length >= 8;
  }
}
