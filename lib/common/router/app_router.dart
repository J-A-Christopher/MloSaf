import 'package:go_router/go_router.dart';
import 'package:mlosafi/features/get-cart-items/Presentation/screens/cart.dart';
import 'package:mlosafi/features/get-all-foods/Presentation/screens/first_route.dart';
import 'package:mlosafi/common/presentation/forgot_password.dart';
import 'package:mlosafi/common/presentation/home_page.dart';
import 'package:mlosafi/features/login/presentation/screens/login_screen.dart';
import 'package:mlosafi/features/signup/presentation/screens/signup.dart';

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
    ),
    GoRoute(
        path: '/first-route', builder: (context, state) => const FirstRoute()),
    // GoRoute(
    //     path: '/food-detail', builder: (context, state) => const FoodDetail()),
    GoRoute(path: '/cart', builder: (context, state) => const CartData()),
  ]);
}
