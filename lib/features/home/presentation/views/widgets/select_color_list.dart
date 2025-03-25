import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectColorList extends StatefulWidget {
  const SelectColorList({super.key});

  @override
  State<SelectColorList> createState() => _SelectColorListState();
}

class _SelectColorListState extends State<SelectColorList> {
  int selectedIndex = 0; // First one is selected
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color(0xFF9E9487), // Brownish
      const Color(0xFFFFB26B), // Orange
      const Color(0xFF365B5E), // Dark teal
    ];

    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
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
                      : ColorsManager.borderFilledColor,
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
    );
  }
}
