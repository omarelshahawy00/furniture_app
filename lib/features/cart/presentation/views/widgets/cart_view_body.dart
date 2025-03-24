import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_fav_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          showLeading: true,
          showTitle: true,
          title: 'My Cart',
          showSuffix: true,
        ),
        const Gap(30),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 24),
                  //   height: 140.h,
                  //   decoration: BoxDecoration(
                  //     color: ColorsManager.primaryColor,
                  //     borderRadius: BorderRadius.circular(16.r),
                  //   ),
                  //   alignment: Alignment.centerRight,
                  //   padding: const EdgeInsets.only(right: 5),
                  //   child: IconButton(
                  //     icon: const Icon(Icons.delete,
                  //         color: Colors.white, size: 30),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: Container(
                        decoration: const BoxDecoration(
                          color: ColorsManager.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
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
                        onAddToCartPressed: () {},
                        onFavoritePressed: () {},
                        rating: 4.5,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
