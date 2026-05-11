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
  const AccountDetailsWidget({super.key, this.iconPath, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath ?? AppAssets.orderIcon,
                width: 24.w,
                height: 24.h,
                color: AppColors.blackColor,
                fit: BoxFit.cover,
              ),
              WidthSpace(16),
              Text(text ?? "", style: AppStyles.black16SemiBold),
            ],
          ),
        ),
        InkWell(
        
          onTap: onTap,
          child: Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
