import 'package:ecommerce_app/core/functions/show_custom_dialog.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/login/presentation/views/widgets/login_view_body.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginBlocListener(),
      ),
    );
  }
}

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginLoading():
            showCustomDialog(
                context: context,
                type: DialogType.loading,
                message: 'Loading...');
            break;
          case LoginSuccess():
            context.pop();
            context.pushNamed(Routes.homeView);
            break;
          case LoginError():
            context.pop();
            showCustomDialog(
                context: context,
                type: DialogType.failure,
                message: state.errMessage);
            break;
          default:
            break;
        }
      },
      child: const LoginViewBody(),
    );
  }
}
