import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageGallery extends StatefulWidget {
  final List<String> images;
  final VoidCallback onBackTap;

  const ProductImageGallery({
    super.key,
    required this.images,
    required this.onBackTap,
  });

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isFavorite = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 380.h,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
                child: Image.network(
                  widget.images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    AppAssets.poloTshert,
                    fit: BoxFit.cover,
                  ),
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 50.h,
          left: 16.w,
          child: CircleIconButton(
            icon: Icons.arrow_back_ios_new,
            onTap: widget.onBackTap,
          ),
        ),
        Positioned(
          top: 50.h,
          right: 16.w,
          child: CircleIconButton(
            icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
            iconColor: _isFavorite ? Colors.red : Colors.black,
            onTap: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
        if (widget.images.length > 1)
          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: isActive ? 20.w : 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}