import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yellow_pass/domain/entities/auth_user.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class AuthService{
  Dio dio = Dio();
  AuthUser authUser = AuthUser();
  
  Future<bool> checkUserAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    String? email = prefs.getString('email');

    if (accessToken != null && email != null) {
      try {
        Response response = await dio.get(
          'http://20.97.204.24/api/v1/boletos/obtenerBoletos/$email',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
        );
        if (response.statusCode == 200) {
          return true;
        }
      } catch (e) {
        debugPrint('Error: $e');
        return false;
      }
    }
    return false;
  }

  Future<String?> loginUser(LoginData data) async {
    try {
      final response = await dio.post(
        'http://20.97.204.24/api/v1/auth/login',
        data: {
          'email': data.name,
          'password': data.password,
        },
      );

      if (response.statusCode == 201) {
        authUser = AuthUser.fromJson(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', authUser.email!);
        prefs.setString('accessToken', authUser.accessToken!);
        return null; 
      } else {
        return 'Error al iniciar sesión, por favor verifica tus credenciales';
      }
    } catch (e) {
      return 'Error al iniciar sesión, por favor verifica tu conexión a internet';
    }
  }

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}