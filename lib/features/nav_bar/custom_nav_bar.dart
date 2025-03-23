import 'package:ecommerce_app/core/app_cubit/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_app/core/functions/nav_bar_service.dart';
import 'package:ecommerce_app/core/models/nav_bar_item.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = context.read<LayoutCubit>();
    List<NavBarItem> navBarItems = NavItemsService.getNavBarItems(context);
    return BlocBuilder<LayoutCubit, int>(
      builder: (context, selectedIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 90.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                navBarItems.length,
                (index) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      layoutCubit.changePage(index, context);
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Column(
                        // key: ValueKey<int>(selectedIndex == index ? 1 : 0),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            selectedIndex == index
                                ? navBarItems[index].filledIcon
                                : navBarItems[index].icon,
                          ),
                          Gap(10.h),
                          FittedBox(
                            child: Text(
                              navBarItems[index].title,
                              style: selectedIndex == index
                                  ? Styles.regular12.copyWith(
                                      color: ColorsManager.primaryColor)
                                  : Styles.regular12.copyWith(
                                      color: ColorsManager.hintTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
