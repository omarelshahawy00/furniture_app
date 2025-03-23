import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ItemInfoSection extends StatelessWidget {
  const ItemInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              Text(
                'Modern Chair',
                style: Styles.semiBold24,
              ),
              const Gap(8),
              const Icon(
                Icons.star,
                color: ColorsManager.primaryColor,
                size: 20,
              ),
              Text(
                " (4.5)",
                style: Styles.regular14.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                '\$100',
                style: Styles.semiBold24.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const Gap(25),
        Text('Details', style: Styles.regular16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: Styles.regular14.copyWith(
            color: ColorsManager.hintTextColor,
          ),
        ),
        const Gap(15),
        Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.borderFilledColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  AssetsManager.chair360,
                  width: 60.r,
                  height: 60.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
