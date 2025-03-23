import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color(0xFF9E9487), // Brownish
      const Color(0xFFFFB26B), // Orange
      const Color(0xFF365B5E), // Dark teal
    ];
    const int selectedIndex = 0; // First one is selected
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomAppBar(
              showLeading: true,
              showSuffix: true,
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  size: 40,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: .19.sh,
            left: 32,
            child: Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(selectedIndex == index ? 2 : 0),
                      width: 38.r,
                      height: 38.r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: selectedIndex == index
                              ? ColorsManager.primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: colors[index],
                        radius: 16.r,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                height: MediaQuery.of(context).size.height * 0.485,
                AssetsManager.chair360,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Text(
                            'Modern Chair',
                            style: Styles.semiBold24,
                          ),
                          const Gap(8),
                          const Icon(
                            Icons.star,
                            color: ColorsManager.primaryColor,
                            size: 20,
                          ),
                          Text(
                            " (4.5)",
                            style: Styles.regular14.copyWith(
                              color: ColorsManager.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$100',
                            style: Styles.semiBold24.copyWith(
                              color: ColorsManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(25),
                    Text('Details', style: Styles.regular16),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: Styles.regular14.copyWith(
                        color: ColorsManager.hintTextColor,
                      ),
                    ),
                    const Gap(15),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.borderFilledColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              AssetsManager.chair360,
                              width: 60.r,
                              height: 60.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(25),
                    CustomButton(
                      text: 'Add to cart',
                      onPressed: () {},
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .44,
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xff73888a),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetsManager.plusIcon)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          '2',
                          style: Styles.bold24.copyWith(color: Colors.white),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetsManager.minusIcon)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
