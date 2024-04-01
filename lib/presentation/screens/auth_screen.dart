// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yellow_pass/infraestructure/services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    super.initState();
    _checkUserAuthAndNavigate();
  }

  Future<void> _checkUserAuthAndNavigate() async {
    final authService = AuthService();
    final isAuthenticated = await authService.checkUserAuth();
    // ignore: use_build_context_synchronously
    final router = GoRouter.of(context);
    if (isAuthenticated) {
      router.go('/home');
    } else {
      router.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
