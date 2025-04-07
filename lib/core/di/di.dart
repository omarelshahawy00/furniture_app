import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/services/api_service.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(apiService: getIt<ApiService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
}
