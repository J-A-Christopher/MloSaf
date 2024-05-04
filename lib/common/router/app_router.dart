import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/presentation/forgot_password.dart';
import 'package:mlosafi/common/presentation/home_page.dart';
import 'package:mlosafi/common/presentation/login_screen.dart';
import 'package:mlosafi/common/presentation/signup.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
     GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
     GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPassword(),
    ),
     GoRoute(
      path: '/signUp',
      builder: (context, state) => const SignUpScreen(),
    )
  ]);
}
