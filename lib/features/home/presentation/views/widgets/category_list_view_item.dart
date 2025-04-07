import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/list_header_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    this.headerTitle,
    this.imageUrl,
    this.productTitle,
    this.productPrice,
    this.productRating,
    this.onProductPressed,
    required this.furniturList,
  });
  final String? headerTitle;
  final String? imageUrl;
  final String? productTitle;
  final double? productPrice;
  final double? productRating;
  final void Function()? onProductPressed;
  final List<FurnitureModel> furniturList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeaderItem(
          title: headerTitle ?? 'Sofaaa',
        ),
        const Gap(15),
        SizedBox(
          height: 222.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: furniturList.length,
            itemBuilder: (context, index) {
              final furniture = furniturList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: CustomCardItem(
                  furnitureModel: furniture,
                  onFavoritePressed: () {},
                  onAddToCartPressed: () {},
                  
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
