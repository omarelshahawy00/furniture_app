import 'package:flutter/material.dart';
import '../models/nav_bar_item.dart';
import '../utils/assets_manager.dart';
import '../routes/routes.dart';

class NavItemsService {
  static List<NavBarItem> getNavBarItems(BuildContext context) {
    List<Map<String, dynamic>> navBarItemsData = [
      {
        "icon": AssetsManager.unactiveHome,
        "filledIcon": AssetsManager.activeHome,
        "title": 'Home',
        "route": Routes.homeView,
      },
      {
        "icon": AssetsManager.unactiveFav,
        "filledIcon": AssetsManager.activeFav,
        "title": 'Favorite',
        "route": Routes.favoritesView,
      },
      {
        "icon": AssetsManager.unactiveCart,
        "filledIcon": AssetsManager.activeCart,
        "title": 'Cart',
        "route": Routes.cartView,
      },
      {
        "icon": AssetsManager.unactiveTracking,
        "filledIcon": AssetsManager.activeTracking,
        "title": 'Oreder Tracking',
        "route": Routes.homeView,
      },
      {
        "icon": AssetsManager.unactiveProfile,
        "filledIcon": AssetsManager.activeProfile,
        "title": 'Profile',
        "route": Routes.profileView,
      },
    ];
    return navBarItemsData
        .map((iconData) => NavBarItem.fromMap(iconData))
        .toList();
  }
}
