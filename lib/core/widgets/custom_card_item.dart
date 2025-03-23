import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final VoidCallback onFavoritePressed;
  final VoidCallback onAddToCartPressed;
  final void Function()? onProductPressed;

  const CustomCardItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.onFavoritePressed,
    required this.onAddToCartPressed,
    this.onProductPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductPressed ?? () {},
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: ColorsManager.borderFilledColor,
          borderRadius: BorderRadius.circular(16.r), // Responsive border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image & Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Image.asset(
                        imageUrl,
                        height: 100.r,
                        width: 100.r,
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

            // Product Details
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: ColorsManager.borderFoucusColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
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
                          title,
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
                        " ($rating)",
                        style: Styles.regular14.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  // Price & Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "\$${price.toInt()}",
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
                          icon: Icon(
                            Icons.add_circle_outlined,
                            size: 40.r,
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
