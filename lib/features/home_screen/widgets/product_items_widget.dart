import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemsWidget extends StatelessWidget {
  final String? name;
  final String? price;
  final String? image; // مسار/رابط صورة المنتج لو موجود في الموديل
  final Function()? onTap;

  const ProductItemsWidget({
    super.key,
    required this.name,
    required this.price,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Hero(
                  tag: "product$name",
                  child: CachedNetworkImage(
                    imageUrl: image ?? AppAssets.shopping,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            HeightSpace(8),
            Text(
              name ?? "",
              style: AppStyles.black16SemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            HeightSpace(3),
            Text(
              price ?? "",
              style: AppStyles.grey12Medium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
