import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/colors_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
            const DefaultTextField(
              hintText: 'Full Name',
            ),
            const Gap(19),
            const DefaultTextField(
              hintText: 'Email or Phone',
            ),
            const Gap(19),
            DefaultTextField(
              hintText: 'Password',
              isPassword: true,
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                size: 20.r,
              ),
            ),
            const Gap(15),
            const Gap(25),
            CustomButton(
              text: 'Verify',
              textStyle: Styles.semiBold18.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                context.pushNamed(Routes.otpVerificationView);
              },
            ),
            const Gap(25),
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
          ],
        ),
      ),
    );
  }
}
