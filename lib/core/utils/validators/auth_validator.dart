class AuthValidators {
  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    if (value.length < 3) return 'Name must be at least 3 characters';
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain letters only';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain uppercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain a number';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) return 'Passwords do not match';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone is required';
    if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
      return 'Enter valid Egyptian phone number';
    }
    return null;
  }
}