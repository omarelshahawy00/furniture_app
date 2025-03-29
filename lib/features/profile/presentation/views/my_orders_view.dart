import 'package:ecommerce_app/features/profile/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyOrdersViewBody(),
      ),
    );
  }
}
