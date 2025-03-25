import 'package:ecommerce_app/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FavoritesViewBody(),
      ),
    );
  }
}
