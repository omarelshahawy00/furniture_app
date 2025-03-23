import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class ListHeaderItem extends StatelessWidget {
  const ListHeaderItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.medium20,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'See all',
            style: Styles.medium16.copyWith(color: ColorsManager.primaryColor),
          ),
        ),
      ],
    );
  }
}
