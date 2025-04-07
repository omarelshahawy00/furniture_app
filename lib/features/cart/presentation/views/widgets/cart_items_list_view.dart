import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_fav_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class CartItemsListView extends StatefulWidget {
  final VoidCallback onItemRemoved;

  const CartItemsListView({super.key, required this.onItemRemoved});

  @override
  State<CartItemsListView> createState() => _CartItemsListViewState();
}

class _CartItemsListViewState extends State<CartItemsListView> {
  List<String> cartItems = [
    'Modern Chair',
    'Modern Chair',
    'Modern Chair',
    'Modern Chair',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.20,
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                setState(() {
                  cartItems.removeAt(index);
                  widget.onItemRemoved(); // Notify the parent widget
                });
              },
            ),
            children: [
              SlidableAction(
                spacing: 100,
                onPressed: (context) {
                  setState(() {
                    cartItems.removeAt(index);
                    widget.onItemRemoved(); // Notify the parent widget
                  });
                },
                padding: EdgeInsets.zero,
                autoClose: true,
                backgroundColor: ColorsManager.primaryColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomFavCard(
              title: cartItems[index],
              price: 100,
              imageUrl: AssetsManager.chair360,
              onCardPressed: () {
                context.pushNamed(Routes.productDetailsView);
              },
              onAddToCartPressed: () {},
              onFavoritePressed: () {},
              rating: 4.5,
              isCartItem: true,
            ),
          ),
        );
      },
    );
  }
}
