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

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Must be 6 or more characters and contain';
    }
    return null;
  }
  // Must be 6 or more characters and contain

  static String? validateLoginPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? validatePhoneNumber(String? number) {
    if (number == null || number.isEmpty) {
      return 'Please enter your phone number';
    }
    if (number.length < 4) {
      return 'Please enter your valid phone number';
    }
    return null;
  }

  static String? validateField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validatePostEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      bool emailValid =
          RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
              .hasMatch(email.trim());
      if (!emailValid) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  static String? websiteFieldValidator(String? value) {
    if (value == null) return null;
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    final isValid = regExp.hasMatch(value);
    if (!isValid) return 'Please enter a valid URL with http or https';
    return null;
  }
}
