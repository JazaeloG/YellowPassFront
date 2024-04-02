import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/notification_details.dart';
import '../../presentation/screens/notifications_screen.dart';

part 'app_router.dart';

class Env{
  static GoRouter router = GoRouter(
    routes: [AppRouter.home, AppRouter.notificationDetails, AppRouter.login],
    initialLocation: AppRouter.login.path,
  );
}