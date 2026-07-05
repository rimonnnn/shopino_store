import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:ecommerce_app/features/prodect_details_screen/widgets/product_bottom_bar.dart';
import 'package:ecommerce_app/features/prodect_details_screen/widgets/product_image_gallery.dart';
import 'package:ecommerce_app/features/prodect_details_screen/widgets/product_info_section.dart';

import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  ProductsModel get product => widget.product;

  void _incrementQuantity() => setState(() => _quantity++);

  void _decrementQuantity() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Added ${_quantity}x ${product.title} to cart"),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                ProductImageGallery(
                  images: images,
                  onBackTap: () => Navigator.pop(context),
                ),
                ProductInfoSection(product: product),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ProductBottomBar(
              quantity: _quantity,
              totalPrice: product.price * _quantity,
              onIncrement: _incrementQuantity,
              onDecrement: _decrementQuantity,
              onAddToCart: _addToCart,
            ),
          ),
        ],
      ),
    );
  }
}
