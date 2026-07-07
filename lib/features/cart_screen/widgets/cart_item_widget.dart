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
  final int quantity;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onRemove;

  const CartItemWidget({
    super.key,
    required this.fitText,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
    this.onIncrease,
    this.onDecrease,
    this.onRemove,
  });

  bool get _isNetworkImage =>
      imagePath != null &&
      (imagePath!.startsWith('http://') || imagePath!.startsWith('https://'));

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
            width: 80.w,
            height: 85.h,
            child: _isNetworkImage
                ? Image.network(
                    imagePath!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AppAssets.shopping, fit: BoxFit.cover);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                  )
                : Image.asset(
                    imagePath?.isNotEmpty == true
                        ? imagePath!
                        : AppAssets.shopping,
                    fit: BoxFit.cover,
                  ),
          ),
          WidthSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        fitText ?? "",
                        style: AppStyles.black16SemiBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: const Icon(Icons.delete, color: Colors.redAccent),
                    ),
                  ],
                ),
                HeightSpace(36),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(price ?? "", style: AppStyles.black16SemiBold),
                      WidthSpace(90),
                      Row(
                        children: [
                          InkWell(
                            onTap: onDecrease,
                            child: Container(
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
                          ),
                          WidthSpace(10),
                          Text(quantity.toString()),
                          WidthSpace(10),
                          InkWell(
                            onTap: onIncrease,
                            child: Container(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
