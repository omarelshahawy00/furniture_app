import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_req_model.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_res_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login(LoginReqModel loginReqModel) async {
    emit(LoginLoading());
    final res = await authRepo.login(loginReqModel);
    res.fold(
      (l) => emit(
        LoginError(l.errMessage),
      ),
      (r) => emit(
        LoginSuccess(r),
      ),
    );
  }

  Future<void> signOut() async {
    emit(LoginSignOutLoading());
    final res = await authRepo.signOut();
    res.fold(
      (l) => emit(
        LoginSignOutError(l.errMessage),
      ),
      (r) => emit(
        LoginSignOutSuccess('Sign out successfully'),
      ),
    );
  }
}
