import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/features/home/presentation/views/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryItem,
    required this.currentIndex,
    required this.selectedIndex,
  });
  final CategoryItemModel categoryItem;

  final int currentIndex;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
      decoration: BoxDecoration(
        color: selectedIndex == currentIndex
            ? ColorsManager.primaryColor
            : ColorsManager.borderFilledColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: categoryItem.icon == null
          ? Text(
              categoryItem.title,
              style: Styles.regular14.copyWith(
                  color: selectedIndex == currentIndex
                      ? Colors.white
                      : ColorsManager.primaryColor),
            )
          : Row(
              children: [
                SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                      selectedIndex == currentIndex
                          ? Colors.white
                          : ColorsManager.primaryColor,
                      BlendMode.srcIn),
                  categoryItem.icon ?? AssetsManager.chairIcon,
                ),
                const Gap(8),
                Text(
                  categoryItem.title,
                  style: Styles.regular14.copyWith(
                      color: selectedIndex == currentIndex
                          ? Colors.white
                          : ColorsManager.primaryColor),
                )
              ],
            ),
    );
  }
}
