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
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case LoginSuccess():
            context.pop();
            context.pushNamed(Routes.homeView);
            break;
          case LoginError():
            context.pop();
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(content: Text(state.errMessage)));
            break;
          default:
            break;
        }
      },
      child: const LoginViewBody(),
    );
  }
}
