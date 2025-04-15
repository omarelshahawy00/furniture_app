import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/custom_exception.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/errors/firebase_exp.dart';
import 'package:ecommerce_app/core/network/constants/api_constant.dart';
import 'package:ecommerce_app/core/network/services/data_base_service.dart';
import 'package:ecommerce_app/core/network/services/firebase_auth_service.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_req_model.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_res_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_res_model.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService authService;
  final DataBaseService firestore;

  AuthRepoImpl({
    required this.authService,
    required this.firestore,
  });

  @override
  Future<Either<Failure, SignupResModel>> signup(
      SignupReqModel signupReqModel) async {
    try {
      // 1. Create user in Firebase Auth
      final user = await authService.createUserWithEmailAndPassword(
        email: signupReqModel.email!,
        password: signupReqModel.password!,
      );
      var uid = user.uid;
      var userData = SignupReqModel(
        uid: uid,
        name: signupReqModel.name,
        email: signupReqModel.email,
        phone: signupReqModel.phone,
        address: signupReqModel.address,
        password: signupReqModel.password,
      ).toJson();
      // 2. Store additional user data in Firestore
      await firestore.addData(
        data: userData,
        path: ApiConstant.addUserData,
        docId: user.uid,
      );
      // 3. Get the user data from Firestore

      return Right(SignupResModel(
        id: user.uid,
        email: user.email ?? '',
        name: signupReqModel.name ?? '',
        phone: signupReqModel.phone,
        address: signupReqModel.address,
      ));
    } on FirebaseFailure catch (e) {
      return Left(FirebaseFailure(e.errMessage));
    } catch (e) {
      return Left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, LoginResModel>> login(
      LoginReqModel loginReqModel) async {
    try {
      final user = await authService.signInWithEmailAndPassword(
        loginReqModel.email,
        loginReqModel.password,
      );
      final userData =
          await firestore.getData(path: ApiConstant.getUserData, uId: user.uid);

      return Right(LoginResModel.fromJson(userData));
    } on FirebaseFailure catch (e) {
      return Left(FirebaseFailure(e.errMessage));
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authService.signOut();
      return const Right(null);
    } on FirebaseFailure catch (e) {
      return Left(FirebaseFailure(e.errMessage));
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
