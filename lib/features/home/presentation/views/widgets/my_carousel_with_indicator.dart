import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/sale_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselWithIndicator extends StatefulWidget {
  const CustomCarouselWithIndicator({
    super.key,
  });

  @override
  _CustomCarouselWithIndicatorState createState() =>
      _CustomCarouselWithIndicatorState();
}

class _CustomCarouselWithIndicatorState
    extends State<CustomCarouselWithIndicator> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: List.generate(3, (index) => const SaleItem()),
        ),
        // Indicator Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 12.0 : 8.0,
              height: _currentIndex == index ? 12.0 : 8.0,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? ColorsManager.primaryColor
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
