import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomFFavCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onDeletePressed;

  const CustomFFavCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    this.onFavoritePressed,
    this.onAddToCartPressed,
    this.onDeletePressed,
  });

  @override
  State<CustomFFavCard> createState() => _CustomFFavCardState();
}

class _CustomFFavCardState extends State<CustomFFavCard> {
  double _offset = 0.0;
  final double _maxSlide = 50.0;
  bool isSwiped = false;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += details.primaryDelta!;
      _offset = _offset.clamp(-_maxSlide, 0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      if (_offset < -_maxSlide / 2) {
        _offset = -_maxSlide;
        isSwiped = true;
      } else {
        _offset = 0;
        isSwiped = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with delete button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 140.h,
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colors.white, size: 30),
            onPressed: widget.onDeletePressed,
          ),
        ),

        // Foreground sliding card
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          left: _offset,
          right: -_offset,
          child: GestureDetector(
            onHorizontalDragUpdate: _onHorizontalDragUpdate,
            onHorizontalDragEnd: _onHorizontalDragEnd,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: 140.h,
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
                              widget.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: IconButton(
                            onPressed: widget.onFavoritePressed,
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
                                        widget.title,
                                        style: Styles.bold16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Gap(4.w),
                                    const Icon(Icons.star,
                                        color: ColorsManager.primaryColor,
                                        size: 20),
                                    Text(
                                      " (${widget.rating})",
                                      style: Styles.regular14.copyWith(
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                                const Gap(30),
                                // Price
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "\$${widget.price.toInt()}",
                                        style: Styles.bold18.copyWith(
                                          color: ColorsManager.primaryColor,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: widget.onAddToCartPressed,
                                      style: IconButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
