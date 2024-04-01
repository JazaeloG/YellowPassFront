import 'package:go_router/go_router.dart';
import 'package:yellow_pass/presentation/screens/auth_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/login_screen.dart';

part 'app_router.dart';

class Env{
  static GoRouter router = GoRouter(
    routes: [AppRouter.auth, AppRouter.home, AppRouter.login],
    initialLocation: AppRouter.auth.path,
  );
}