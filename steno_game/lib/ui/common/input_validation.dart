mixin InputValidation {
  String? isValidEmail(String email) {
    final pattern = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == "") {
      return "Please enter your email address";
    } else if (!(pattern.hasMatch(email))) {
      return "Invalid email address";
    } else {
      return null;
    }
  }

  String? isValidPassword(String password) {
    if (password == "") {
      return "Please enter password";
    } else if (password.trim().length < 6) {
      return "Password must be greater than 6";
    }
    return null;
  }

  String? isValidInput(String input, String inputType) {
    if (input == "") {
      return "Please input your ${inputType.toLowerCase()}";
    } else {
      return null;
    }
  }
}
