import 'package:ecommerce_app/core/routing/router_generator_config.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await sl<FavoriteCubit>().loadFavorites();
  await sl<CartCubit>().loadCart();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouterGeneratorConfig.goRouter,
          title: 'Shopino',
          debugShowCheckedModeBanner: false,
        );
      },
      child: Scaffold(),
    );
  }
}
