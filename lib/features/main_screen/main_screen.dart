import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/account_screen/account_screen.dart';
import 'package:ecommerce_app/features/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductsCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 2,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeIcon,
              color: currentIndex == 0 ? AppColors.primaryColor : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.cardIcon,
              color: currentIndex == 1 ? AppColors.primaryColor : Colors.grey,
            ),

            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.accountIcon,
              color: currentIndex == 2 ? AppColors.primaryColor : Colors.grey,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
