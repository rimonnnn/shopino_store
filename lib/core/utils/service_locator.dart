import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServicesLocator() {
  DioHelper dio = DioHelper();

  sl.registerLazySingleton<DioHelper>(() => dio);
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl()));
  sl.registerLazySingleton(() => StorageHelper());
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>(), sl<StorageHelper>()));
}
