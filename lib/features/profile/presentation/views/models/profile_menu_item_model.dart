import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ProfileMenuItemModel {
  final String icon;
  final String title;
  final String route;

  ProfileMenuItemModel(
      {required this.icon, required this.title, required this.route});
}

final List<ProfileMenuItemModel> menuItems = [
  ProfileMenuItemModel(
    icon: AssetsManager.cahrge,
    title: "History of order",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.payment,
    title: "Payment methods",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.notification,
    title: "Notifications",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.award,
    title: "Reward card",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.promoCode,
    title: "Promo code",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.privacy,
    title: "Privacy & policy",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.language,
    title: "Language",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.help,
    title: "Help",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.share,
    title: "Share app",
    route: Routes.myOrdersView,
  ),
  ProfileMenuItemModel(
    icon: AssetsManager.logout,
    title: "Log out",
    route: Routes.myOrdersView,
  ),
];
