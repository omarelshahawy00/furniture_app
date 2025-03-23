import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/views/widgets/pin_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OTPVerificationView extends StatefulWidget {
  const OTPVerificationView({super.key, required this.fromForgetPassword});

  final bool fromForgetPassword;

  @override
  _OTPVerificationViewState createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _onPinCompleted() {
    print("Entered PIN: ${_pinController.text}");
    // Navigate to the next screen or verify OTP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomAppBar(
                  showLeading: true,
                ),
                Center(child: SvgPicture.asset(AssetsManager.verfiy)),
                const Gap(25),
                Center(
                  child: Text(
                    'Enter code',
                    style: Styles.medium24,
                  ),
                ),
                const Gap(25),
                Center(
                  child: PinInputField(
                    pinController: _pinController,
                    onCompleted: _onPinCompleted,
                  ),
                ),
                const Gap(15),
                TextButton(
                  onPressed: () {
                    // Handle resend code logic here
                  },
                  child: Text(
                    "Resend code?",
                    style: Styles.medium16
                        .copyWith(color: ColorsManager.primaryColor),
                  ),
                ),
                const Gap(25),
                CustomButton(
                  text:
                      widget.fromForgetPassword ? 'Continue' : 'Create Account',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
