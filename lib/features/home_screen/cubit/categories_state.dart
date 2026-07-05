import 'package:ecommerce_app/features/home_screen/models/category_model.dart';

abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;

  CategoriesLoadedState({required this.categories, this.selectedCategory});
}

class CategoriesErrorState extends CategoriesState {
  final String? errorMessage;
  CategoriesErrorState({required this.errorMessage});
}