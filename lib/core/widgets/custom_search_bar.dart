import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.showCameraIcon = true, // Default: Show camera icon
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: ColorsManager.borderFilledColor, // Background color
          borderRadius: BorderRadius.circular(25), // Rounded corners
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey), // Search icon
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none, // Remove default border
                  hintStyle: Styles.regular16
                      .copyWith(color: ColorsManager.hintTextColor),
                ),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: const Icon(
                Icons.mic_none,
                color: ColorsManager.primaryColor,
              ), // Mic icon
              onPressed: onMicPressed,
            ),
            if (showCameraIcon) // Conditionally show camera icon
              IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: ColorsManager.primaryColor,
                ),
                onPressed: onCameraPressed,
              ),
          ],
        ),
      ),
    );
  }
}
