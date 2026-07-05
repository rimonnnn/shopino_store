import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/auth/log_in/widgets/loading_widget.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/features/home_screen/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/products_state.dart';
import 'package:ecommerce_app/features/home_screen/models/category_model.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';
import 'package:ecommerce_app/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/product_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final isSelected = "";
  @override
  void initState() {
    context.read<ProductsCubit>().fetchProducts();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpace(55),
              Text("Discover", style: AppStyles.black32SemiBold),
              HeightSpace(16),
              Row(
                children: [
                  PrimaryTextField(
                    width: MediaQuery.of(context).size.width * 0.7,
                    hintText: "Search for clothes...",
                  ),
                  WidthSpace(8),
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.filterIcon,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              HeightSpace(16),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.categories.map((cat) {
                          return CategoryItemWidget(
                            categoryName: cat.name,
                            isSelected: state.selectedCategory == cat,
                            onPress: () {
                              context.read<CategoriesCubit>().selectCategory(
                                cat,
                              );
                              if (cat.id == 0) {
                                context.read<ProductsCubit>().fetchProducts();
                              } else {
                                context
                                    .read<ProductsCubit>()
                                    .fetchProductCategory(cat.id);
                              }
                            },
                          );
                        }).toList(),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              HeightSpace(24),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return LoadingWidget(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                    );
                  }
                  if (state is ProductsLoadedState) {
                    List<ProductsModel> products = state.products;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductItemsWidget(
                          name: product.title,
                          price: product.price.toString(),
                          image: product.images.isNotEmpty
                              ? product.images.first
                              : null,
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text(
                      "Something went wrong ...",
                      style: AppStyles.black16SemiBold.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
