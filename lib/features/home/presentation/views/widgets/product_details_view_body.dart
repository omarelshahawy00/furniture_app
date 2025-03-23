import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/item_info_section.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/product_quantity_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/select_color_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomAppBar(
              showLeading: true,
              showSuffix: true,
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  size: 40,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: .19.sh,
            left: 32,
            child: const SelectColorList(),
          ),
          Column(
            children: [
              Image.asset(
                height: MediaQuery.of(context).size.height * 0.485,
                AssetsManager.chair360,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const ItemInfoSection(),
                    const Gap(25),
                    CustomButton(
                      text: 'Add to cart',
                      onPressed: () {},
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .44,
            child: const ProductQuantityItem(),
          ),
        ],
      ),
    );
  }
}
