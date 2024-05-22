import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/presentation/cart.dart';
import 'package:mlosafi/features/get-all-foods/Presentation/screens/first_route.dart';
import 'package:mlosafi/common/presentation/food_detail.dart';
import 'package:mlosafi/common/presentation/forgot_password.dart';
import 'package:mlosafi/common/presentation/home_page.dart';
import 'package:mlosafi/features/login/presentation/screens/login_screen.dart';
import 'package:mlosafi/common/presentation/orders.dart';
import 'package:mlosafi/common/presentation/profile.dart';
import 'package:mlosafi/features/signup/presentation/screens/signup.dart';
import 'package:mlosafi/common/router/nested_nav.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellHomePageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHomePageNavigatorKey');
final _shellCartPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCartPageNavigatorKey');
final _shellOrdersPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellOrdersPageNavigatorKey');
final _shellProfilePageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfilePageNavigatorKey');

final goRouter =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
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
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(navigatorKey: _shellHomePageNavigatorKey, routes: [
          GoRoute(
              path: '/first-route',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FirstRoute()),
              routes: [
                GoRoute(
                    path: 'food-detail',
                    builder: (context, state) =>  FoodDetail(selectedId: state.extra as String,))
              ])
        ]),
        StatefulShellBranch(navigatorKey: _shellCartPageNavigatorKey, routes: [
          GoRoute(
              path: '/cart',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: CartData()))
        ]),
        StatefulShellBranch(
            navigatorKey: _shellOrdersPageNavigatorKey,
            routes: [
              GoRoute(
                  path: '/orders',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: MyOrders()))
            ]),
        StatefulShellBranch(
            navigatorKey: _shellProfilePageNavigatorKey,
            routes: [
              GoRoute(
                  path: '/profile',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: MyProfile()))
            ])
      ])
]);
