part of 'env_routes.dart';

class AppRouter{
  static GoRoute home = GoRoute(
    path: '/home',
    builder: (context, state) => const MyHomePage(),
  );

  static GoRoute login = GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  );

  static GoRoute notifications = GoRoute(
    path: '/notifications',
    builder: (context, state) => const NotificationsScreen(),
  );

  static GoRoute notificationDetails = GoRoute(
    path: '/notification-details/:messageId',
    builder: (context, state) => DetailsScreen(
      pushMessageId: state.pathParameters['messageId'] ?? '',
    ),
  );
}