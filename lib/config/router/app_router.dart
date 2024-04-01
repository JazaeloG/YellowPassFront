part of 'env_routes.dart';

class AppRouter{
  static GoRoute auth = GoRoute(
    path: '/auth',
    builder: (context, state) => const AuthScreen(),
  );
  
  static GoRoute home = GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  );

  static GoRoute login = GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  );
}