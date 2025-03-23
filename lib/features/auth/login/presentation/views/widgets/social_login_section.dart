import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsManager.google),
        SvgPicture.asset(AssetsManager.facebook),
        SvgPicture.asset(AssetsManager.twitter),
      ],
    );
  }
}
