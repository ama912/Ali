class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(password);
  }

  // static bool isPhoneNumberValid(String phoneNumber) {
  //   return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  // }

  // static bool isPhoneNumberValid(String phoneNumber) {
  //   // أرقام الجوال السورية تبدأ بـ 93 أو 94 أو 95 أو 96 أو 98 أو 99
  //   // ثم يليها 7 أرقام، والعدد الكلي = 9 أرقام
  //   return RegExp(r'^(9[3-689])[0-9]{7}$').hasMatch(phoneNumber);
  // }
  static bool isPhoneNumberValid(String phoneNumber) {
    // تدعم: 93... أو 093... مع باقي البادئات
    return RegExp(r'^0?9[3-689][0-9]{7}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
