import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_cubit.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_state.dart';
import 'package:ecommerce_app/features/favorite_screen/models/favorit_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Favorites", style: AppStyles.black32SemiBold),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        bloc: sl<FavoriteCubit>(),
        builder: (context, state) {
          if (state is! FavoriteCartLoaded || state.isEmpty) {
            return Center(
              child: Text("No favorites yet", style: AppStyles.grey16W400),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 20.sp, bottom: 20.sp),
              itemCount: state.items.length,
              separatorBuilder: (_, _) => HeightSpace(14),
              itemBuilder: (context, index) {
                final item = state.items[index];
                return _FavoriteItemWidget(
                  item: item,
                  onRemove: () => sl<FavoriteCubit>().toggleFavorite(item),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _FavoriteItemWidget extends StatelessWidget {
  const _FavoriteItemWidget({required this.item, required this.onRemove});

  final FavoritItemModel item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.sp),
            child: Image.network(
              item.imagePath,
              width: 70.sp,
              height: 70.sp,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 70.sp,
                height: 70.sp,
                color: AppColors.secondaryColor,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          WidthSpace(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.fitText,
                  style: AppStyles.black16SemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                HeightSpace(6),
                Text(
                  '\$ ${item.price.toStringAsFixed(2)}',
                  style: AppStyles.grey16W400,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
