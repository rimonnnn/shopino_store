import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/routing/router_generator_config.dart';
import 'package:ecommerce_app/features/auth/log_in/login_screen.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
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
          title: 'News App',
          debugShowCheckedModeBanner: false,
        );
      },
      child: Scaffold(),
    );
  }
}
