import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/presentation/views/models/profile_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBar(
              showTitle: true,
              title: 'My Profile',
            ),
            const Gap(30),
            Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  child: Image.asset(
                    AssetsManager.person1,
                  ),
                ),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omar Mahmoud',
                      style: Styles.medium20,
                    ),
                    Text('omar.elshahawy00@gamil.com',
                        style: Styles.regular14.copyWith(
                          color: ColorsManager.hintTextColor,
                        )),
                  ],
                ),
                const Spacer(),
                InkWell(
                    onTap: () {}, child: SvgPicture.asset(AssetsManager.edit)),
              ],
            ),
            const Gap(40),
            ListView.builder(
              shrinkWrap: true, // To fit content
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent extra scrolling
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ProfileItem(
                  item: menuItems[index],
                  menuItems: menuItems,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final ProfileMenuItemModel item;
  final List<ProfileMenuItemModel> menuItems;
  const ProfileItem({
    super.key,
    required this.item,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(item.route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              item.icon,
            ),
            const Gap(8),
            Text(
              item.title,
              style: Styles.regular18,
            ),
            const Spacer(),
            item.title == 'Log out' || item.title == 'Share app'
                ? const Gap(0)
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManager.primaryColor,
                  ),
          ],
        ),
      ),
    );
  }
}
