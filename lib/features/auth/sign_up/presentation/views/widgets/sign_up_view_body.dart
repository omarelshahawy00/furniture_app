import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/default_text_field.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/utils/auth_validation.dart';
import '../../../../../../core/widgets/custom_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // form is valid
      final userData = SignupReqModel(
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text,
        address: _addressController.text,
        phone: _phoneController.text,
      );

      context.read<SignupCubit>().signup(userData);
      
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
                child: SvgPicture.asset(AssetsManager.signUp),
              ),
              const Gap(25),
              Center(
                child: Text(
                  'Create new account',
                  style: Styles.medium24,
                ),
              ),
              const Gap(25),

              // Full Name
              DefaultTextField(
                controller: _nameController,
                hintText: 'Full Name',
                validator: MyValidators.displayNameValidator,
              ),
              // address
              const Gap(19),
              DefaultTextField(
                controller: _addressController,
                hintText: 'Address',
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const Gap(19),
              // Email or Phone
              DefaultTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                validator: MyValidators.phoneValidator,
              ),
              const Gap(19),
              // Email or Phone
              DefaultTextField(
                controller: _emailController,
                hintText: 'Email',
                validator: MyValidators.emailValidator,
              ),
              const Gap(19),

              // Password
              DefaultTextField(
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20.r,
                ),
                validator: MyValidators.passwordValidator,
              ),

              const Gap(25),

              // Verify Button
              CustomButton(
                text: 'Create Account',
                textStyle: Styles.semiBold18.copyWith(
                  color: Colors.white,
                ),
                onPressed: _validateAndSubmit,
              ),

              const Gap(25),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Styles.regular16,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      ' Log in',
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
