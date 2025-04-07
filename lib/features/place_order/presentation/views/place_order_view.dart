import 'package:ecommerce_app/features/place_order/presentation/views/widgets/place_order_view_body.dart';
import 'package:flutter/material.dart';

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PlaceOrderViewBody(),
      ),
    );
  }
}
