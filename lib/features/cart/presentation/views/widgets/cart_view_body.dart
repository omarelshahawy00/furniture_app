import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/items_total_price_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool _showBottomBar = true;
  bool _atListEnd = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      // Step 3: Detect if user reached the bottom
      if (currentScroll >= maxScroll - 200) {
        if (!_atListEnd) {
          setState(() {
            _atListEnd = true;
            _showBottomBar = true; // Fix it in place
          });
        }
      } else {
        if (_atListEnd) {
          setState(() => _atListEnd = false); // Enable behavior again
        }

        // Step 1 & 2: Toggle behavior only when NOT at the end
        if (direction == ScrollDirection.forward && _showBottomBar) {
          setState(() => _showBottomBar = false);
        } else if (direction == ScrollDirection.reverse && !_showBottomBar) {
          setState(() => _showBottomBar = true);
        }
      }
    });
  }

  void _onItemRemoved() {
    if (!_showBottomBar) {
      setState(() {
        _showBottomBar = true; // Show bottom bar when item is removed
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const CustomAppBar(
                showTitle: true,
                title: 'My Cart',
                showSuffix: true,
              ),
              const Gap(30),
              CartItemsListView(
                onItemRemoved: _onItemRemoved,
              ),
              Gap(220.h), // Space for bottom bar
            ],
          ),
        ),

        // Bottom Checkout Section
        Positioned(
          left: 24,
          right: 24,
          bottom: 24,
          child: _atListEnd
              ? AnimatedSlide(
                  offset: _showBottomBar ? Offset.zero : const Offset(0, 1),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: _showBottomBar ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        const ItemsTotalPriceSection(),
                        const Gap(12),
                        CustomButton(
                          text: 'Checkout',
                          onPressed: () {
                            context.pushNamed(Routes.placeOrderView);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : AnimatedSlide(
                  offset: _showBottomBar ? Offset.zero : const Offset(0, 1),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: _showBottomBar ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        const ItemsTotalPriceSection(),
                        const Gap(12),
                        CustomButton(
                          text: 'Checkout',
                          onPressed: () {
                            context.pushNamed(Routes.placeOrderView);
                          },
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
