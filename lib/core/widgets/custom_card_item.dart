import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomCardItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final double? price;
  final double? rating;
  final VoidCallback onFavoritePressed;
  final VoidCallback onAddToCartPressed;
  final void Function()? onProductPressed;
  final FurnitureModel furnitureModel;

  const CustomCardItem({
    super.key,
    this.imageUrl,
    this.title,
    this.price,
    this.rating,
    required this.onFavoritePressed,
    required this.onAddToCartPressed,
    this.onProductPressed,
    required this.furnitureModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductPressed ??
          () {
            context.pushNamed(
              Routes.productDetailsView,
              extra: furnitureModel,
            );
          },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: ColorsManager.borderFilledColor,
          borderRadius: BorderRadius.circular(16), // Responsive border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image & Favorite Icon
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              furnitureModel.imageUrl ?? AssetsManager.sofa,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: onFavoritePressed,
                      icon: const Icon(
                        Icons.favorite_border,
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: ColorsManager.borderFoucusColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          furnitureModel.name ?? "Sofaaaaa",
                          style: Styles.bold16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.star,
                        color: ColorsManager.primaryColor,
                        size: 20,
                      ),
                      Text(
                        " (${rating ?? 4.5})",
                        style: Styles.regular14.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  // Price & Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "\$${furnitureModel.price ?? 200.toInt()}",
                          overflow: TextOverflow.ellipsis,
                          style: Styles.bold18.copyWith(
                              color: ColorsManager
                                  .primaryColor), // Using theme styles
                        ),
                      ),
                      IconButton(
                          onPressed: onAddToCartPressed,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: const Icon(
                            Icons.add_circle_outlined,
                            size: 40,
                            color: ColorsManager.primaryColor,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
