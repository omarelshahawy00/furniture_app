import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBar(
              showLeading: true,
            ),
            SvgPicture.asset(AssetsManager.forgetPass),
            const Gap(25),
            Text(
              'Forget Password ?',
              style: Styles.bold24,
            ),
            const Gap(25),
            const DefaultTextField(hintText: 'Email or Phone'),
            const Gap(25),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                context.pushNamed(
                  Routes.otpVerificationView,
                  extra: {'fromForgotPassword': true},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
