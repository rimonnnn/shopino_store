import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/auth/log_in/login_screen.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterGeneratorConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
    ],
  );
}
