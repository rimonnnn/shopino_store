import 'package:ecommerce_app/features/home_screen/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> products;
  ProductsLoadedState({required this.products});
}

class ProductsErrorState extends ProductsState {
  final String message;
  ProductsErrorState(this.message);
}
