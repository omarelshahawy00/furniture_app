import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/auth_validation.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/default_text_field.dart';
import 'package:ecommerce_app/features/auth/login/data/models/login_req_model.dart';
import 'package:ecommerce_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/login/presentation/views/widgets/or_divider.dart';
import 'package:ecommerce_app/features/auth/login/presentation/views/widgets/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final userData = LoginReqModel(
        email: _emailController.text,
        password: _passwordController.text,
      );

      context.read<LoginCubit>().login(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(60),
              Center(
                child: SvgPicture.asset(AssetsManager.login),
              ),
              const Gap(25),
              Center(
                child: Text(
                  'Log in your account',
                  style: Styles.medium24,
                ),
              ),
              const Gap(25),
              DefaultTextField(
                hintText: 'Username',
                controller: _emailController,
                validator: (email) {
                  if (email != null && email.isEmpty) {
                    return 'Email can\'t be empty';
                  }
                  return null;
                },
              ),
              const Gap(19),
              DefaultTextField(
                hintText: 'Password',
                isPassword: true,
                controller: _passwordController,
                validator: (p) {
                  if (p!.isEmpty) {
                    return 'Password can\'t be empty';
                  }
                  return null;
                },
              ),
              const Gap(15),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.forgetPasswordView);
                },
                child: Text(
                  'Forget Password?',
                  style: Styles.medium16.copyWith(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
              const Gap(25),
              CustomButton(
                text: 'Log in',
                textStyle: Styles.semiBold18.copyWith(
                  color: Colors.white,
                ),
                onPressed: _login,
              ),
              const Gap(25),
              const OrDivider(),
              const Gap(15),
              const SocialLoginSection(),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: Styles.regular16,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.signUpView);
                    },
                    child: Text(
                      ' Sign Up',
                      style: Styles.semiBold16.copyWith(
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}
