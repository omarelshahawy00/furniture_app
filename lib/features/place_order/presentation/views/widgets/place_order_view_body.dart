import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlaceOrderViewBody extends StatelessWidget {
  const PlaceOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          showLeading: true,
          showSuffix: true,
          showTitle: true,
          title: 'Place Order',
        ),
        const Gap(30),
        DefaultTextField(
          hintText: 'Location',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: ColorsManager.hintTextColor,
            ),
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
