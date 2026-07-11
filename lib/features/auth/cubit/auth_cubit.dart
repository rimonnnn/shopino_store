import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app/features/auth/model/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo, this._storageHelper) : super(AuthInatial());

  final AuthRepo _authRepo;
  final StorageHelper _storageHelper;

  void login({required String email, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res = await _authRepo.login(
      email,
      password,
    );

    res.fold(
      (error) {
        emit(ErrorAuthState(error));
      },
      (right) async {
        await _storageHelper.saveToken(
          right.accessToken ?? "",
          right.refreshToken ?? "",
        );

        emit(SuccessAuthState("Login Successfully"));
      },
    );
  }

  Future<void> logout() async {
    await sl<StorageHelper>().clearTokens();
    await sl<FavoriteCubit>().clearFavorites();
    await sl<CartCubit>().clearCart();
  }
}
