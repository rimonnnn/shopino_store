import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressWidget extends StatelessWidget {
  final String? addressName;
  final String? addressDetails;
  const CustomAddressWidget({super.key, this.addressName, this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 1.sp),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.secondaryColor,
            size: 30.sp,
          ),
          WidthSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(addressName ?? "", style: AppStyles.black16SemiBold),
              HeightSpace(4),
              Text(
                addressDetails ?? "",
                style: AppStyles.grey16W400.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
