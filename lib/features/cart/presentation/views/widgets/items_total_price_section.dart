import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsTotalPriceSection extends StatelessWidget {
  final double totalPrice;

  const ItemsTotalPriceSection({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      // margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: ColorsManager.borderFilledColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorsManager.borderFoucusColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Total Price:',
                style: Styles.regular20.copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                '\$${totalPrice.toStringAsFixed(2)} \$',
                style: Styles.semiBold20
                    .copyWith(color: ColorsManager.primaryColor),
              ),
            ],
          ),
          Text(
            '2 Items',
            style:
                Styles.regular18.copyWith(color: ColorsManager.hintTextColor),
          ),
        ],
      ),
    );
  }
}
