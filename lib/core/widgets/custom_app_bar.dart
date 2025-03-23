import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.showLeading = false,
    this.onLeadingPressed,
    this.showTitle = false,
    this.showSuffix = false,
    this.title,
    this.suffix,
  });
  final bool? showLeading, showTitle, showSuffix;
  final Widget? suffix;
  final String? title;

  final void Function()? onLeadingPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: showLeading!,
              child: IconButton(
                onPressed: onLeadingPressed ?? () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Visibility(
              visible: showTitle!,
              child: Text(
                showTitle == false ? '' : title!,
                style: Styles.medium24,
              ),
            ),
            Visibility(
              visible: showSuffix!,
              child: showSuffix == true
                  ? suffix ??
                      CircleAvatar(
                        radius: 20.r,
                        child: Image.asset(AssetsManager.person),
                      )
                  : const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}
