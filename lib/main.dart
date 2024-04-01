import 'package:flutter/material.dart';
import 'package:yellow_pass/config/router/env_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yellow Pass',
      debugShowCheckedModeBanner: false,
      routerConfig: Env.router,
    );
  }
}
