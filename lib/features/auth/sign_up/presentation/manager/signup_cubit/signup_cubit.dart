import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_res_model.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup(SignupReqModel signupReqModel) async {
    emit(SignupLoading());
    final res = await authRepo.signup(signupReqModel);
    res.fold(
      (l) => emit(
        SignupError(l.errMessage),
      ),
      (r) => emit(
        SignupSuccess(r),
      ),
    );
  }
}
