import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/presentation/views/models/category_item_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBar(
                showLeading: true,
                showTitle: true,
                title: categoryItem.title,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
