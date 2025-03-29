import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onMicPressed;
  final VoidCallback? onCameraPressed;
  final ValueChanged<String>? onChanged;
  final bool showCameraIcon;
  final double? width;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onMicPressed,
    this.onCameraPressed,
    this.onChanged,
    this.showCameraIcon = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Ensure full width
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: ColorsManager.borderFoucusColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.borderFoucusColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: ColorsManager.borderFilledColor,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: SizedBox(
            width: showCameraIcon ? 80.w : 40.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: IconButton(
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: const Icon(
                      Icons.mic_none,
                      color: ColorsManager.primaryColor,
                    ),
                    onPressed: onMicPressed ?? () {},
                  ),
                ),
                if (showCameraIcon)
                  Flexible(
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: ColorsManager.primaryColor,
                      ),
                      onPressed: onCameraPressed ?? () {},
                    ),
                  ),
                const Gap(16),
              ],
            ),
          ),
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: Styles.regular16.copyWith(
            color: ColorsManager.hintTextColor,
          ),
        ),
      ),
    );
  }
}
