/// [Validator] - A mixin use for validating the email address with REGEX
class Validator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter your name';
    }
    if (name.length < 3) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    // bool emailValid = RegExp(
    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //     .hasMatch(email);
    if (!emailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Must be 6 or more characters and contain

  static String? validateField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}
