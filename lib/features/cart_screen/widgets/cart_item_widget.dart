import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartItemWidget extends StatelessWidget {
  final String? fitText;
  final String? price;
  final String? imagePath;

  const CartItemWidget({
    super.key,
    required this.fitText,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.w,
            height: 85.h,

            child: Image.asset(imagePath ?? "", fit: BoxFit.cover),
          ),
          WidthSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fitText ?? "", style: AppStyles.black16SemiBold),
                    Icon(Icons.delete, color: Colors.redAccent),
                  ],
                ),
                HeightSpace(36),
                Row(
                  children: [
                    Text(price ?? "", style: AppStyles.black16SemiBold),
                    WidthSpace(90),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.sp,
                            vertical: 12.sp,
                          ),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 0.5.sp,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: SvgPicture.asset(AppAssets.minusIcon),
                        ),
                        WidthSpace(10),
                        Text("1"),
                        WidthSpace(10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.sp,
                            vertical: 6.sp,
                          ),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 0.5.sp,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: SvgPicture.asset(AppAssets.plusIcon),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
