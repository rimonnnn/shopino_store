import 'package:ecommerce_app/features/home_screen/cubit/products_state.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._homeRepo) : super(ProductsInitialState());
  final HomeRepo _homeRepo;

  void fetchProducts() async {
    emit(ProductsLoadingState());

    final res = await _homeRepo.getProducts();
    res.fold(
      (error) => emit(ProductsErrorState(error)),
      (right) => emit(ProductsLoadedState(products: right)),
    );
  }

  void fetchProductCategory(int categoryId) async {
  emit(ProductsLoadingState());
  final res = await _homeRepo.getProductCategory(categoryId);
  res.fold(
    (error) => emit(ProductsErrorState(error)),
    (right) => emit(ProductsLoadedState(products: right)),
  );
}
}
