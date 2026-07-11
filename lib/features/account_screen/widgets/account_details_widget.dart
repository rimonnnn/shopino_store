import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountDetailsWidget extends StatelessWidget {
  final String? iconPath;
  final String? text;
  final Function()? onTap;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  const AccountDetailsWidget({
    super.key,
    this.iconPath,
    this.text,
    this.onTap,
    this.iconColor,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color:
                    iconBackgroundColor ??
                    AppColors.primaryColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath ?? AppAssets.orderIcon,
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    iconColor ?? AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            WidthSpace(14),
            Expanded(
              child: Text(text ?? "", style: AppStyles.black16SemiBold),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.sp,
              color: AppColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}