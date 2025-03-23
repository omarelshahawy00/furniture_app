import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_manager.dart';

class SaleItem extends StatelessWidget {
  const SaleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.only(left: 50.w, right: 34.w, top: 23.h, bottom: 23.h),
      decoration: BoxDecoration(
        color: ColorsManager.borderFilledColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '30%\nOFF',
            style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff9B5619),
                fontFamily: GoogleFonts.lobster().fontFamily),
          ),
          Image.asset(
            AssetsManager.chair,
            height: 130,
            width: 160,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
