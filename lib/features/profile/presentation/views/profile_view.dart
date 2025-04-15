import 'package:ecommerce_app/core/functions/show_custom_dialog.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileViewBodyWithBlocBuilder(),
      ),
    );
  }
}

class ProfileViewBodyWithBlocBuilder extends StatelessWidget {
  const ProfileViewBodyWithBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSignOutSuccess) {
          context.goNamed(Routes.loginView);
        } else if (state is LoginSignOutError) {
          showCustomDialog(
              context: context,
              type: DialogType.failure,
              message: state.errMessage);
        } else if (state is LoginSignOutLoading) {
          showCustomDialog(
              context: context,
              type: DialogType.loading,
              message: "Logging Out...");
        }
      },
      child: const ProfileViewBody(),
    );
  }
}
