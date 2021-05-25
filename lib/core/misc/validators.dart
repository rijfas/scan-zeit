class Validators {
  static String validateUserName(String value) {
    return (value == null || value.isEmpty)
        ? 'user name cannot be empty!'
        : null;
  }

  static String validatePassword(String value) {
    if (value == null || value.isEmpty) return 'password cannot be empty!';
    if (value.length < 6) return 'password must contain at least 6 characters!';
    return null;
  }

  static String validateEmail(String value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) return null;
    return 'invalid email!';
  }

  static String validatePhoneNumber(String value) {
    if (value == null || value.isEmpty || value.length < 10)
      return 'invalid mobile number!';
    return null;
  }
}
