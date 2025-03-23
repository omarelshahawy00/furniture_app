import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomFavCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final VoidCallback onFavoritePressed;
  final VoidCallback onAddToCartPressed;

  const CustomFavCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.onFavoritePressed,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity, // Responsive width
      height: 140.h, // Responsive height
      decoration: BoxDecoration(
        color: ColorsManager.borderFilledColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Left Section: Product Image & Favorite Icon
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: onFavoritePressed,
                    icon: Icon(
                      Icons.favorite_outlined,
                      color: ColorsManager.primaryColor,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right Section: Product Details & Add to Cart Button
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: ColorsManager.borderFoucusColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            Gap(4.w),
                            const Icon(Icons.star,
                                color: ColorsManager.primaryColor, size: 20),
                            Text(
                              " ($rating)",
                              style: Styles.regular14
                                  .copyWith(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const Gap(30),
                        // Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "\$${price.toInt()}",
                                style: Styles.bold18.copyWith(
                                  color: ColorsManager.primaryColor,
                                ),
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Add to Cart Button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
