import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/features/address_screen/address_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/log_in/login_screen.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/features/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/prodect_details_screen/product_details_screen.dart';
import 'package:ecommerce_app/features/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

class RouterGeneratorConfig {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashScreen,
    errorBuilder: (context, state) => const NotFoundScreen(),

  
    redirect: (context, state) async {
      // Let splash screen handle its own startup logic without interference.
      if (state.matchedLocation == AppRoutes.splashScreen) return null;

      final accessToken = await sl<StorageHelper>().getAccessToken();
      final refreshToken = await sl<StorageHelper>().getRefreshToken();
      final isLoggedIn =
          (accessToken != null && accessToken.isNotEmpty) ||
          (refreshToken != null && refreshToken.isNotEmpty);

      final isAuthRoute =
          state.matchedLocation == AppRoutes.loginScreen ||
          state.matchedLocation == AppRoutes.signUpScreen;

      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.loginScreen;
      }

      if (isLoggedIn && isAuthRoute) {
        return AppRoutes.mainScreen;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),

      // Shared CartCubit scope: Home (inside MainScreen), ProductDetails, Cart.
      // CartCubit must be registered as a lazySingleton in the service
      // locator for BlocProvider.value below to actually share state.
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: sl<CartCubit>(), child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.mainScreen,
            name: AppRoutes.mainScreen,
            builder: (context, state) => const MainScreen(),
          ),
          GoRoute(
            path: AppRoutes.productDetailsScreen,
            name: AppRoutes.productDetailsScreen,
            builder: (context, state) {
              final product = state.extra;
              if (product is! ProductsModel) {
                return const NotFoundScreen();
              }
              return ProductDetailsScreen(product: product);
            },
          ),
          GoRoute(
            path: AppRoutes.cartScreen,
            name: AppRoutes.cartScreen,
            builder: (context, state) => const CartScreen(),
          ),
        ],
      ),
    ],
  );
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Page not found")));
  }
}
