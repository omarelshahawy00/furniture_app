import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_fav_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.15,
            motion: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: ColorsManager.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: const Center(
                  child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              )),
            ),
            children: [
              SlidableAction(
                onPressed: (context) {
                  // Handle delete action
                },
                padding: EdgeInsets.zero,
                backgroundColor: ColorsManager.primaryColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomFavCard(
              title: 'Modern Chair',
              price: 100,
              imageUrl: AssetsManager.chair360,
              onCardPressed: () {
                context.pushNamed(Routes.productDetailsView);
              },
              onAddToCartPressed: () {},
              onFavoritePressed: () {},
              rating: 4.5,
            ),
          ),
        );
      },
    );
  }
}
