import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widgets/product_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSpace(55),
            Text("Discover", style: AppStyles.black32SemiBold),
            HeightSpace(16),
            Row(
              children: [
                PrimaryTextField(width: 281, hintText: "Search for clothes..."),
                WidthSpace(8),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.filterIcon,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            HeightSpace(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryItemWidget(categoryName: 'All'),
                  CategoryItemWidget(categoryName: 'Tshirts'),
                  CategoryItemWidget(categoryName: 'Jeans'),
                  CategoryItemWidget(categoryName: 'Shoes'),
                  CategoryItemWidget(categoryName: 'boots'),
                ],
              ),
            ),
            HeightSpace(24),
            Expanded(
              child: ProductItemsWidget(
                name: 'Fit Polo T Shirt',
                price: '\$1,690',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
