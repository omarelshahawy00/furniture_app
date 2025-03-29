import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBar(
              showLeading: true,
              showTitle: true,
              title: 'My Orders',
              showSuffix: true,
            ),
            const Gap(30),
            const CustomSearchBar(
              showCameraIcon: false,
            ),
            const Gap(25),
            const CartItemsListView(),
            const Gap(25),
            CustomButton(
              text: 'You have 3 items in cart',
              onPressed: () {},
            ),
            const Gap(25),
          ],
        ),
      ),
    );
  }
}
