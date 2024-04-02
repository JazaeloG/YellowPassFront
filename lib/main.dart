import 'package:flutter/material.dart';
import 'package:yellow_pass/config/router/env_routes.dart';
import 'package:yellow_pass/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yellow Pass',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: Env.router,
    );
  }
}
