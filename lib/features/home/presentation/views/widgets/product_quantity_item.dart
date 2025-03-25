// import 'package:ecommerce_app/core/theme/styles.dart';
// import 'package:ecommerce_app/core/utils/assets_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class ProductQuantityItem extends StatelessWidget {
//   const ProductQuantityItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicWidth(
//       child: Container(
//         padding: const EdgeInsets.all(7),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(100),
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//           decoration: BoxDecoration(
//             color: const Color(0xff73888a),
//             borderRadius: BorderRadius.circular(50),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                   onTap: () {},
//                   child: SvgPicture.asset(AssetsManager.plusIcon)),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                 child: Text(
//                   '2',
//                   style: Styles.bold24.copyWith(color: Colors.white),
//                 ),
//               ),
//               InkWell(
//                   onTap: () {},
//                   child: SvgPicture.asset(AssetsManager.minusIcon)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantityItem extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  const ProductQuantityItem({
    super.key,
    this.initialQuantity = 1,
    required this.onQuantityChanged,
  });

  @override
  State<ProductQuantityItem> createState() => _ProductQuantityItemState();
}

class _ProductQuantityItemState extends State<ProductQuantityItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF577173), // Background color
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrease Button
            _buildButton(Icons.remove, _decrement),

            // Quantity Number
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                '$quantity',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Increase Button
            _buildButton(Icons.add, _increment),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 30.w,
        height: 30.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Icon(
          icon,
          size: 20.r,
          color: const Color(0xFF577173), // Icon color
        ),
      ),
    );
  }
}
