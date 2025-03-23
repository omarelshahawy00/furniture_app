import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinInputField extends StatelessWidget {
  final TextEditingController pinController;
  final VoidCallback onCompleted;

  const PinInputField({
    super.key,
    required this.pinController,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.r,
      height: 57.r,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.borderFilledColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: ColorsManager.primaryColor
                .withValues(alpha: .5), // Darker border when focused
            width: 3,
          ),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: const BoxDecoration(
        color: ColorsManager.borderFoucusColor, // Change background on focus
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: ColorsManager.primaryColor, // Darker border when focused
            width: 3,
          ),
        ),
      ),
    );

    return Pinput(
      separatorBuilder: (index) {
        return SizedBox(width: 20.w);
      },
      controller: pinController,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: (pin) => onCompleted(),
    );
  }
}
