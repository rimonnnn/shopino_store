import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/features/home_screen/models/category_model.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitialState());
  final HomeRepo _homeRepo;

  void fetchCategories() async {
    emit(CategoriesLoadingState());
    final Either<String, List<CategoryModel>> res = await _homeRepo
        .getCategories();
    res.fold(
      (left) => emit(CategoriesErrorState(errorMessage: left)),
      (right) => emit(CategoriesLoadedState(categories: right)),
    );
  }

  void selectCategory(CategoryModel category) {
    final currentState = state;
    if (currentState is CategoriesLoadedState) {
      emit(
        CategoriesLoadedState(
          categories: currentState.categories,
          selectedCategory: category,
        ),
      );
    }
  }
}
