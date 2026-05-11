import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/account_screen/widgets/account_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account", style: AppStyles.black32SemiBold),
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpace(24),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(20),
              AccountDetailsWidget(
                iconPath: AppAssets.orderIcon,
                text: "My Orders",
              ),
              HeightSpace(25),
              Divider(color: Color(0xffAAAAAA), thickness: 4),
              HeightSpace(25),
              AccountDetailsWidget(
                iconPath: AppAssets.addressIcon,
                text: "Address Book",
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRoutes.addressScreen);
                },
              ),

              HeightSpace(25),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(25),
              AccountDetailsWidget(iconPath: AppAssets.faqsIcon, text: "FAQs"),

              HeightSpace(25),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(25),
              AccountDetailsWidget(
                iconPath: AppAssets.detailsIcon,
                text: "My Details",
              ),

              HeightSpace(25),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(25),
              AccountDetailsWidget(
                iconPath: AppAssets.helpCenterIcon,
                text: "Help Center",
              ),

              HeightSpace(25),
              Divider(color: AppColors.secondaryColor, thickness: 5),
              HeightSpace(120),
              Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 24,
                    color: Colors.redAccent,
                  ),
                  WidthSpace(16),
                  Text(
                    "Logout",
                    style: AppStyles.black16SemiBold.copyWith(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
