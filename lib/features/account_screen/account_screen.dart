import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_outline_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/account_screen/widgets/account_details_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F9),
        elevation: 0,
        title: Text("Account", style: AppStyles.black32SemiBold),
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpace(8),
              _SectionCard(
                children: [
                  AccountDetailsWidget(
                    iconPath: AppAssets.orderIcon,
                    text: "My Orders",
                  ),
                  _divider(),
                  AccountDetailsWidget(
                    iconPath: AppAssets.addressIcon,
                    text: "Address Book",
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRoutes.addressScreen);
                    },
                  ),
                ],
              ),
              HeightSpace(20),
              _SectionCard(
                children: [
                  AccountDetailsWidget(
                    iconPath: AppAssets.detailsIcon,
                    text: "My Details",
                  ),
                  _divider(),
                  AccountDetailsWidget(
                    iconPath: AppAssets.faqsIcon,
                    text: "FAQs",
                  ),
                  _divider(),
                  AccountDetailsWidget(
                    iconPath: AppAssets.helpCenterIcon,
                    text: "Help Center",
                  ),
                ],
              ),
              HeightSpace(20),
              _SectionCard(
                children: [
                  AccountDetailsWidget(
                    iconPath: AppAssets.orderIcon,
                    text: "Logout",
                    iconColor: Colors.redAccent,
                    iconBackgroundColor: Colors.redAccent.withOpacity(0.08),
                    onTap: () => showLogOutDialog(context),
                  ),
                ],
              ),
              HeightSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      color: AppColors.secondaryColor.withOpacity(0.4),
      thickness: 1,
      height: 1,
    );
  }

  void showLogOutDialog(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(24.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.redAccent,
                    size: 40.sp,
                  ),
                ),
                HeightSpace(20),
                Text(
                  "Logout?",
                  style: AppStyles.black16SemiBold.copyWith(fontSize: 22.sp),
                ),
                HeightSpace(10),
                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: AppStyles.grey16W400,
                ),
                HeightSpace(28),
                PrimaryButtonWidget(
                  borderRadius: 12,
                  width: double.infinity,
                  height: 54.h,
                  buttonText: "Yes, Logout",
                  buttonColor: Colors.redAccent,
                  onPress: () {
                    parentContext.read<AuthCubit>().logout();
                    parentContext.pushReplacementNamed(AppRoutes.loginScreen);
                  },
                ),
                HeightSpace(12),
                CustomOutlineButtonWidget(
                  width: double.infinity,
                  height: 54.h,
                  buttonText: "No, Cancel",
                  borderColor: Colors.grey,
                  textColor: AppColors.blackColor,
                  onPress: () => context.pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}
