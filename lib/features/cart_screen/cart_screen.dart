import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart_screen/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: Text("Cart", style: AppStyles.black32SemiBold),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is! CartLoaded || state.isEmpty) {
            return Center(
              child: Text("Your cart is empty", style: AppStyles.grey16W400),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeightSpace(20),

                  // Cart Items
                  ...state.items.map(
                    (item) => Padding(
                      padding: EdgeInsets.only(bottom: 14.sp),
                      child: CartItemWidget(
                        fitText: item.fitText,
                        price: '\$ ${item.totalPrice.toStringAsFixed(2)}',
                        imagePath: item.imagePath,

                        quantity: item.quantity,
                        onIncrease: () =>
                            context.read<CartCubit>().increaseQuantity(item.id),
                        onDecrease: () =>
                            context.read<CartCubit>().decreaseQuantity(item.id),
                        onRemove: () =>
                            context.read<CartCubit>().removeItem(item.id),
                      ),
                    ),
                  ),

                  HeightSpace(30),

                  // Summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-total", style: AppStyles.grey16W400),
                      Text(
                        '\$ ${state.subtotal.toStringAsFixed(2)}',
                        style: AppStyles.black16SemiBold,
                      ),
                    ],
                  ),
                  HeightSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("VAT (%)", style: AppStyles.grey16W400),
                      Text(
                        '\$ ${state.vat.toStringAsFixed(2)}',
                        style: AppStyles.black16SemiBold,
                      ),
                    ],
                  ),
                  HeightSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping fee", style: AppStyles.grey16W400),
                      Text(
                        '\$ ${state.shippingFee.toStringAsFixed(2)}',
                        style: AppStyles.black16SemiBold,
                      ),
                    ],
                  ),
                  HeightSpace(16),
                  Divider(color: AppColors.secondaryColor, thickness: 1),
                  HeightSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: AppStyles.black16SemiBold),
                      Text(
                        '\$ ${state.total.toStringAsFixed(2)}',
                        style: AppStyles.black16SemiBold,
                      ),
                    ],
                  ),
                  HeightSpace(50),
                  PrimaryButtonWidget(
                    onPress: () {
                      // TODO: Checkout logic
                    },
                    buttonText: "Go To Checkout",
                  ),
                  HeightSpace(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
