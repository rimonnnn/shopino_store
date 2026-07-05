import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductsModel product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSpace(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: AppStyles.black16SemiBold.copyWith(fontSize: 22.sp),
                ),
              ),
              WidthSpace(8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  product.category.name,
                  style: AppStyles.black16SemiBold.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          HeightSpace(8),
          Row(
            children: [
              Icon(Icons.star, color: const Color(0xffFFA928), size: 20.sp),
              WidthSpace(4),
              Text("4.5", style: AppStyles.black16SemiBold),
              WidthSpace(6),
              Text(
                "(120 reviews)",
                style: AppStyles.grey16W400.copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          HeightSpace(16),
          Text(
            "Description",
            style: AppStyles.black16SemiBold.copyWith(fontSize: 16.sp),
          ),
          HeightSpace(6),
          Text(product.description, style: AppStyles.grey16W400),
          HeightSpace(220),
        ],
      ),
    );
  }
}