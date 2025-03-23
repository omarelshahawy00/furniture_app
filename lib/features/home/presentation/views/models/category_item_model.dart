import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class CategoryItemModel {
  final String title;
  final String? icon;

  CategoryItemModel({
    required this.title,
    this.icon,
  });
  factory CategoryItemModel.fromJson(Map<String, dynamic> map) {
    return CategoryItemModel(
      title: map['title'],
      icon: map['icon'],
    );
  }
}

class CategoryItemService {
  static List<CategoryItemModel> getCategoryItems() {
    List<Map<String, dynamic>> categoryItemData = [
      {
        'title': ' All ',
        'icon': null,
      },
      {
        'title': 'Chair',
        'icon': AssetsManager.chairIcon,
      },
      {
        'title': 'Sofa',
        'icon': AssetsManager.sofaIcon,
      },
      {
        'title': 'Desk',
        'icon': AssetsManager.deskIcon,
      },
      {
        'title': 'Accessories',
        'icon': AssetsManager.chairIcon,
      },
    ];
    return categoryItemData
        .map((item) => CategoryItemModel.fromJson(item))
        .toList();
  }
}
