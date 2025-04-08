import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/presentation/views/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SeeAllCategoryView extends StatelessWidget {
  const SeeAllCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryItemModel> categoryItems =
        CategoryItemService.getCategoryItems();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const CustomAppBar(
                showLeading: true,
                showTitle: true,
                title: 'See All Categories',
              ),
              const SizedBox(
                  height: 16), // Add some space between app bar and list
              Expanded(
                child: ListView.builder(
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    return categoryItems[index].icon != null
                        ? ListTile(
                            title: Text(categoryItems[index].title),
                            leading: categoryItems[index].icon != null
                                ? SvgPicture.asset(
                                    categoryItems[index].icon!,
                                    width: 40,
                                    height: 40,
                                  )
                                : null,
                            onTap: () {
                              context.pushNamed(
                                Routes.categoryView,
                                extra: categoryItems[index],
                              );
                            },
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
