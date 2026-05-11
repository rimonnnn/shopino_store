import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart_screen/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("My Cart", style: AppStyles.black32SemiBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpace(20),
              CartItemWidget(
                fitText: 'Regular Fit Slogan',
                price: '\$ 1,190',
                imagePath: AppAssets.poloTshert,
              ),
              HeightSpace(14),
              CartItemWidget(
                fitText: 'Regular Fit Polo',
                price: '\$ 1,100',
                imagePath: AppAssets.shoes,
              ),
              HeightSpace(145),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub-total", style: AppStyles.grey16W400),
                  Text("\$ 5,870", style: AppStyles.black16SemiBold),
                ],
              ),
              HeightSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("VAT (%)", style: AppStyles.grey16W400),
                  Text("\$ 0.00", style: AppStyles.black16SemiBold),
                ],
              ),
              HeightSpace(16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping fee", style: AppStyles.grey16W400),
                  Text("\$ 80", style: AppStyles.black16SemiBold),
                ],
              ),
              HeightSpace(16),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: AppStyles.black16SemiBold),
                  Text("\$ 5,950", style: AppStyles.black16SemiBold),
                ],
              ),
              HeightSpace(50),
              PrimaryButtonWidget(onPress: () {}, buttonText: "Go To Checkout"),
            ],
          ),
        ),
      ),
    );
  }
}
