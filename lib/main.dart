import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yellow_pass/config/router/env_routes.dart';
import 'package:yellow_pass/config/theme/app_theme.dart';

import 'infraestructure/bloc/notifications_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotificationsBloc()),
      ], 
      child: const MainApp())
  );
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
