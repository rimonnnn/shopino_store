import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/home_screen/models/category_model.dart';
import 'package:ecommerce_app/features/home_screen/models/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndPoints.products,
      );
      if (response.statusCode == 200) {
        final products = productsModelFromJson(response.data);
        return Right(products);
      } else {
        return const Left("Failed to fetch products");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductCategory(
    int categoryId, // ✅ غيرت النوع من String لـ int
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: "${ApiEndPoints.categories}/$categoryId/products", // ✅
      );
      if (response.statusCode == 200) {
        final products = productsModelFromJson(response.data);

        return Right(products);
      } else {
        return const Left("Failed to fetch products");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndPoints.categories,
      );
      if (response.statusCode == 200) {
        final category = categoryModelFromJson(response.data);
        category.insert(
          0,
          CategoryModel(
            id: 0,
            name: "All",
            slug: "all",
            image: "",
            creationAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
        return Right(category.cast<CategoryModel>());
      } else {
        return const Left("Failed to fetch products");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
