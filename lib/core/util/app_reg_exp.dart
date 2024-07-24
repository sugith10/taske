/// A utility class for commonly used regular expressions.
final class AppRegExp {
  AppRegExp._();

  // Validate email
  static RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');

  // Validate password
  static RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');


  // Validate name
  static RegExp nameRexExp = RegExp(r'^[a-zA-Z]+$');
}
