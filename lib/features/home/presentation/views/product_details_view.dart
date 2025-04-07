import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.borderFilledColor,
      body: SafeArea(
        child: ProductDetailsViewBody(),
      ),
    );
  }
}
