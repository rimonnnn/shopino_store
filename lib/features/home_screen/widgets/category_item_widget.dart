import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String? categoryName;
  final VoidCallback? onPress;
  final bool? isSelected;
  const CategoryItemWidget({
    super.key,
    required this.categoryName,
    this.onPress,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ?? () {},
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 8.sp),
        decoration: BoxDecoration(
          color: isSelected == true
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          border: isSelected == true
              ? null
              : Border.all(color: AppColors.secondaryColor, width: 0.5.w),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(
          categoryName ?? "",
          style: AppStyles.black16SemiBold.copyWith(
            color: isSelected == true
                ? AppColors.whiteColor
                : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
