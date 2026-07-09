import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_outline_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(24.sp),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeightSpace(40),
            Icon(
              Icons.warning_amber_outlined,
              color: Colors.redAccent,
              size: 50.sp,
            ),
            HeightSpace(20),
            Text(
              "Logout?",
              style: AppStyles.black16SemiBold.copyWith(fontSize: 24.sp),
            ),
            HeightSpace(10),
            Text(
              "Are you sure you want to logout?",
              style: AppStyles.grey16W400,
            ),
            HeightSpace(32),
            PrimaryButtonWidget(
              borderRadius: 12,
              width: 280.w,
              height: 54.h,
              buttonText: "Yes, Logout",
              buttonColor: Colors.redAccent,
              onPress: () {},
            ),
            HeightSpace(12),
            CustomOutlineButtonWidget(
              width: 280.w,
              height: 54.h,
              buttonText: "No, Cancel",
              borderColor: Colors.grey,
              textColor: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
