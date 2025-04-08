import 'package:ecommerce_app/core/app_cubit/change_category_cubit/change_catergory_cubit.dart';
import 'package:ecommerce_app/core/app_cubit/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/home/presentation/views/models/category_item_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryItemsBlocBuilder extends StatelessWidget {
  const CategoryItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryItemModel> categoryItems =
        CategoryItemService.getCategoryItems();
    return BlocBuilder<ChangeCatergoryCubit, int>(
      builder: (context, selectedIndex) {
        return SizedBox(
          height: 40.h, // Keep the height fixed
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Scrollable categories
            itemCount: categoryItems.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.read<ChangeCatergoryCubit>().changeCategory(index);
                context.pushNamed(
                  Routes.categoryView,
                  extra: categoryItems[index],
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CategoryItem(
                  currentIndex: index,
                  selectedIndex: selectedIndex,
                  categoryItem: categoryItems[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
