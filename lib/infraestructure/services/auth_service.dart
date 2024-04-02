import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';

class AuthService{
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

   Future<String?> recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
   }

  Future<String?> signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}