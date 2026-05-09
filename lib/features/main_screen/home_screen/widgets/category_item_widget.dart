import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String? categoryName;
  const CategoryItemWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 8.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 0.5.w),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(categoryName ?? "", style: AppStyles.black16SemiBold),
    );
  }
}
