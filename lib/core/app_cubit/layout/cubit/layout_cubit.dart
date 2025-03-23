import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/functions/nav_bar_service.dart';
import 'package:ecommerce_app/core/models/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutCubit extends Cubit<int> {
  LayoutCubit() : super(0);

  void changePage(int index, BuildContext context) {
    List<NavBarItem> navBarItems = NavItemsService.getNavBarItems(context);
    context.goNamed(navBarItems[index].route);
    emit(index);
  }

  
}
