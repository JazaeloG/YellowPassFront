import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  Dio dio = Dio();
  
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
}