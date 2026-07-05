import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;
  int _quantity = 1;
  bool _isFavorite = false;

  ProductsModel get product => widget.product;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementQuantity() => setState(() => _quantity++);

  void _decrementQuantity() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  @override
  Widget build(BuildContext context) {
    final images = product.images.isNotEmpty
        ? product.images
        : [AppAssets.shopping];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---- Image Gallery ----
                Stack(
                  children: [
                    SizedBox(
                      height: 380.h,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: images.length,
                        onPageChanged: (index) =>
                            setState(() => _currentImageIndex = index),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.r),
                              bottomRight: Radius.circular(24.r),
                            ),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                    AppAssets.poloTshert,
                                    fit: BoxFit.cover,
                                  ),
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    // Back button
                    Positioned(
                      top: 50.h,
                      left: 16.w,
                      child: _CircleIconButton(
                        icon: Icons.arrow_back_ios_new,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    // Favorite button
                    Positioned(
                      top: 50.h,
                      right: 16.w,
                      child: _CircleIconButton(
                        icon: _isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        iconColor: _isFavorite ? Colors.red : Colors.black,
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
                      ),
                    ),
                    // Dots indicator
                    if (images.length > 1)
                      Positioned(
                        bottom: 12.h,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (index) {
                            final isActive = index == _currentImageIndex;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              width: isActive ? 20.w : 6.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            );
                          }),
                        ),
                      ),
                  ],
                ),

                Padding(
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
                              style: AppStyles.black16SemiBold.copyWith(
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                          WidthSpace(8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
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
                          Icon(
                            Icons.star,
                            color: const Color(0xffFFA928),
                            size: 20.sp,
                          ),
                          WidthSpace(4),
                          Text("4.5", style: AppStyles.black16SemiBold),
                          WidthSpace(6),
                          Text(
                            "(120 reviews)",
                            style: AppStyles.grey16W400.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      HeightSpace(16),
                      Text(
                        "Description",
                        style: AppStyles.black16SemiBold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      HeightSpace(6),
                      Text(product.description, style: AppStyles.grey16W400),
                      HeightSpace(220),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ---- Bottom bar ----
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                              "\$ ${(product.price * _quantity).toStringAsFixed(0)}",
                              style: AppStyles.black16SemiBold.copyWith(
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        // Quantity selector
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: _decrementQuantity,
                                icon: const Icon(Icons.remove),
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "$_quantity",
                                style: AppStyles.black16SemiBold,
                              ),
                              IconButton(
                                onPressed: _incrementQuantity,
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
                      onPress: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Added ${_quantity}x ${product.title} to cart",
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                      },
                      buttonText: "Add to Cart",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Icon(icon, size: 18.sp, color: iconColor),
      ),
    );
  }
}
