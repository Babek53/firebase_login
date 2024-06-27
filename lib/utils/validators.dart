class Validator {
  Validator._();

  static String? nameValidator(String? name) {
    name = name?.trim() ?? '';
    return name.isEmpty ? 'Name is required!' : null;
  }

  static const String _emailPattern =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"
      r'"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09'
      r'\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|'
      r'\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}'
      r'(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f'
      r'\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  static String? emailValidator(String? email) {
    email = email?.trim() ?? '';
    return email.isEmpty
        ? 'Email is required!'
        : !RegExp(_emailPattern).hasMatch(email)
            ? 'Invalid email format!'
            : null;
  }

  static String? passwordValidator(String? password) {
    password = password ?? '';
    var errorMessage = '';
    if (password.isEmpty) {
      errorMessage = 'Password is required!';
    } else {
      if (password.length < 6) {
        errorMessage = 'Password must be at least 6 characters long!';
      }
      if (!password.contains(RegExp('[a-z]'))) {
        errorMessage += '\nPassword must contain at least one lowercase letter';
      }
      if (!password.contains(RegExp('[A-Z]'))) {
        errorMessage += '\nPassword must contain at least one uppercase letter';
      }
      if (!password.contains(RegExp('[0-9]'))) {
        errorMessage += '\nPassword must contain at least one digit';
      }
    }
    return errorMessage.isNotEmpty ? errorMessage.trim() : null;
  }
}
