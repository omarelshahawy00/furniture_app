import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/firebase_exp.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_req_model.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_res_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_res_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupResModel>> signup(SignupReqModel signupReqModel);
  Future<Either<Failure, LoginResModel>> login(LoginReqModel loginReqModel);
  Future<Either<Failure, void>> signOut();
}
