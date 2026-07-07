import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/address_screen/address_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/log_in/login_screen.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/features/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/prodect_details_screen/product_details_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGeneratorConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) {
          return AddressScreen();
        },
      ),

      // Shared CartCubit scope: Home (inside MainScreen), ProductDetails, Cart
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.mainScreen,
            name: AppRoutes.mainScreen,
            builder: (context, state) {
              return MainScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.productDetailsScreen,
            name: AppRoutes.productDetailsScreen,
            builder: (context, state) {
              ProductsModel product = state.extra as ProductsModel;
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