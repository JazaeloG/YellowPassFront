import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:yellow_pass/infraestructure/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w900,
        ),
      ),
      title: 'Yellow Pass',
      headerWidget: const IntroWidget(),
      onLogin: (loginData) {
        return authService.loginUser(loginData);
      }, 
      onRecoverPassword: (email) {
        return authService.recoverPassword(email);
      },
      onSubmitAnimationCompleted: () {
        context.go('/home');
      },
      passwordValidator: (value) {
        if(value!.isEmpty){
          return "La contraseña no puede estar vacia";
        }
        if(value.length < 6){
          return "La contraseña debe tener al menos 6 caracteres";
        }
        return null;
      },
      userValidator: (value){
        if(value!.isEmpty){
          return "El correo no puede estar vacio";
        }
        if(!value.contains('@')){
          return "El correo no es valido";
        }
        if(!value.contains('.')){
          return "El correo no es valido";
        }
        return null;
      },
      navigateBackAfterRecovery: true,

    );
  }
}


class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Disfruta de viajes inolvidables de la mano de ",
              ),
              TextSpan(
                text: "Yellow Pass",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
        Row(
          children: <Widget>[
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Iniciar Sesión"),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}