import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ProfileMenuItemModel {
  final String icon;
  final String title;
  final VoidCallback onTap;

  ProfileMenuItemModel(
      {required this.icon, required this.title, required this.onTap});
}

final List<ProfileMenuItemModel> menuItems = [
  ProfileMenuItemModel(
      icon: AssetsManager.cahrge, title: "History of order", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.payment, title: "Payment methods", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.notification, title: "Notifications", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.award, title: "Reward card", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.promoCode, title: "Promo code", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.privacy, title: "Privacy & policy", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.language, title: "Language", onTap: () {}),
  ProfileMenuItemModel(icon: AssetsManager.help, title: "Help", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.share, title: "Share app", onTap: () {}),
  ProfileMenuItemModel(
      icon: AssetsManager.logout, title: "Log out", onTap: () {}),
];
