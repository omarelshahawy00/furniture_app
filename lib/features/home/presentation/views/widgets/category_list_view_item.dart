import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/list_header_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.headerTitle,
    required this.imageUrl,
    required this.productTitle,
    required this.productPrice,
    required this.productRating,
    this.onProductPressed,
  });
  final String headerTitle;
  final String imageUrl;
  final String productTitle;
  final double productPrice;
  final double productRating;
  final void Function()? onProductPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeaderItem(
          title: headerTitle,
        ),
        const Gap(15),
        SizedBox(
          height: 222.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 14),
              child: CustomCardItem(
                imageUrl: imageUrl,
                title: productTitle,
                price: productPrice,
                rating: productRating,
                onFavoritePressed: () {},
                onAddToCartPressed: () {},
                onProductPressed: onProductPressed ??
                    () {
                      context.pushNamed(Routes.productDetailsView);
                    },
              ),
            ),
          ),
        )
      ],
    );
  }
}
