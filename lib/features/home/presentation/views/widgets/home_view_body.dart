import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item.dart';
import 'package:ecommerce_app/core/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentation/manager/fetch_home_data_cubit/fetch_home_data_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/category_items_bloc_builder.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/category_list_view_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/my_carousel_with_indicator.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/sale_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Gap(20),
            homeViewAppBar(context, title: 'Let’s furnish your\nhome'),
            const Gap(25),
            Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.notification,
                ),
                const Gap(8),
                const Expanded(child: CustomSearchBar()),
              ],
            ),
            Gap(25.h),
            const CustomCarouselWithIndicator(),
            const Gap(30),
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.seeAllCategoryView ,
                    extra: 'See all categories');
              },
              child: Text(
                'See all',
                style:
                    Styles.medium16.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
            const Gap(15),
            const CategoryItemsBlocBuilder(),
            const Gap(30),
            BlocBuilder<FetchHomeDataCubit, FetchHomeDataState>(
              builder: (context, state) {
                if (state is FetchHomeDataSuccess) {
                  return CategoryListViewItem(
                    furniturList: state.furnitureList,
                    // onProductPressed: () {},
                    headerTitle: 'Sofa',
                    // imageUrl: AssetsManager.sofa,
                    // productTitle: 'Sofa',
                    // productPrice: 100,
                    // productRating: 4.5,
                  );
                } else if (state is FetchHomeDataFailure) {
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const Gap(34),
            const CategoryListViewItem(
              furniturList: [],
              headerTitle: 'Chair',
              // imageUrl: AssetsManager.chair,
              // productTitle: 'Chair',
              // productPrice: 50,
              // productRating: 4.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget homeViewAppBar(BuildContext context, {required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.regular24,
        ),
        CircleAvatar(
          radius: 20.r,
          child: Image.asset(AssetsManager.person),
        ),
      ],
    );
  }
}
