import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/features/main_screen/account_screen/account_screen.dart';
import 'package:ecommerce_app/features/main_screen/card_screen/card_screen.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), CardScreen(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
