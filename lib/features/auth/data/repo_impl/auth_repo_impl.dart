import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/network/constants/api_constant.dart';
import 'package:ecommerce_app/core/network/services/api_service.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_req_model.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_res_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_res_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SignupResModel>> signup(
      SignupReqModel signupReqModel) async {
    try {
      final response = await apiService.post(
          endPoint: ApiConstant.registerEndPoint,
          data: signupReqModel.toJson());

      return Right(SignupResModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResModel>> login(
      LoginReqModel loginReqModel) async {
    try {
      final response = await apiService.post(
        endPoint: ApiConstant.loginEndPoint,
        data: loginReqModel.toJson(),
      );
      final res = LoginResModel.fromJson(response);

      return Right(res);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
