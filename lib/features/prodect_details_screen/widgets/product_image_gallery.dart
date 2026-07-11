import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/circle_icon_button.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_cubit.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_state.dart';
import 'package:ecommerce_app/features/favorite_screen/models/favorit_item_model.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageGallery extends StatefulWidget {
  final List<String> images;
  final VoidCallback onBackTap;
  final ProductsModel product;

  const ProductImageGallery({
    super.key,
    required this.images,
    required this.onBackTap,
    required this.product,
  });

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    final product = widget.product;
    sl<FavoriteCubit>().toggleFavorite(
      FavoritItemModel(
        id: product.id.toString(),
        fitText: product.title,
        price: product.price.toDouble(),
        imagePath: product.images.isNotEmpty
            ? product.images.first
            : AppAssets.poloTshert,
      ),
    );
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
                child: Hero(
                  tag: "product${widget.product.title}",
                  child: CachedNetworkImage(
                    imageUrl: widget.images[index],
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.poloTshert, fit: BoxFit.cover),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
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
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            bloc: sl<FavoriteCubit>(),
            builder: (context, state) {
              final isFav = sl<FavoriteCubit>().isFavorite(
                widget.product.id.toString(),
              );
              return CircleIconButton(
                icon: isFav ? Icons.favorite : Icons.favorite_border,
                iconColor: isFav ? Colors.red : Colors.black,
                onTap: _toggleFavorite,
              );
            },
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
