import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottomBar extends StatelessWidget {
  final int quantity;
  final num totalPrice;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;

  const ProductBottomBar({
    super.key,
    required this.quantity,
    required this.totalPrice,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.sp, 16.h, 24.sp, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: AppStyles.grey16W400.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    HeightSpace(2),
                    Text(
                      "\$ ${totalPrice.toStringAsFixed(0)}",
                      style: AppStyles.black16SemiBold.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secondaryColor),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: onDecrement,
                        icon: const Icon(Icons.remove),
                        color: AppColors.primaryColor,
                      ),
                      Text("$quantity", style: AppStyles.black16SemiBold),
                      IconButton(
                        onPressed: onIncrement,
                        icon: const Icon(Icons.add),
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            HeightSpace(14),
            PrimaryButtonWidget(
              width: double.infinity,
              onPress: onAddToCart,
              buttonText: "Add to Cart",
            ),
          ],
        ),
      ),
    );
  }
}