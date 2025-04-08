import 'package:ecommerce_app/core/functions/show_custom_dialog.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignUpBlocListener(),
      ),
    );
  }
}

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        switch (state) {
          case SignupLoading():
            showCustomDialog(
              context: context,
              type: DialogType.loading,
              message: 'Loading...',
            );
            break;
          case SignupSuccess():
            context.pop();
            context.pop();
            showCustomDialog(
              context: context,
              type: DialogType.success,
              message: 'Account created successfully!',
            );

            break;
          case SignupError():
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
      child: const SignUpViewBody(),
    );
  }
}
