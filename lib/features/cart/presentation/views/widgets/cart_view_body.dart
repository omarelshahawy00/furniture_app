import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/items_total_price_section.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBar(
              showTitle: true,
              title: 'My Cart',
              showSuffix: true,
            ),
            const Gap(30),
            const CartItemsListView(),
            const Gap(25),
            const ItemsTotalPriceSection(),
            const Gap(25),
            CustomButton(
              text: 'Checkout',
              onPressed: () {},
            ),
            const Gap(25),
          ],
        ),
      ),
    );
  }
}
