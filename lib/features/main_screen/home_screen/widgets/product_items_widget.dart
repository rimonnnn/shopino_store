import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemsWidget extends StatelessWidget {
  final String? name;
  final String? price;

  const ProductItemsWidget({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  AppAssets.poloTshert,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
        );
      },
    );
  }
}
