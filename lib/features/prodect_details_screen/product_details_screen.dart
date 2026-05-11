import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Details", style: AppStyles.black32SemiBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.poloTshert,
                    width: 341.w,
                    height: 368.h,
                    fit: BoxFit.cover,
                  ),
                  HeightSpace(12),
                  Text(
                    "Fit Polo T Shirt",
                    style: AppStyles.black16SemiBold.copyWith(fontSize: 24),
                  ),
                  HeightSpace(12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFA928), size: 20),
                        WidthSpace(2),
                        Text("4.0/5", style: AppStyles.black16SemiBold),
                        WidthSpace(2),
                        Text(
                          "(45 reviews)",
                          style: AppStyles.grey16W400.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeightSpace(15),
                  Text(
                    "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                    style: AppStyles.grey16W400,
                  ),
                  HeightSpace(240),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  children: [
                    Divider(thickness: 1, color: AppColors.secondaryColor),
                    HeightSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: AppStyles.grey16W400.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            HeightSpace(2),
                            Text(
                              "\$ 1,190",
                              style: AppStyles.black16SemiBold.copyWith(
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        WidthSpace(16),
                        PrimaryButtonWidget(
                          width: 240.w,
                          onPress: () {},
                          buttonText: "Add to Cart",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
