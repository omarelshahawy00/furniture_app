import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartQuantityItem extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;
  const CartQuantityItem({
    super.key,
    this.initialQuantity = 1,
    required this.onQuantityChanged,
  });

  @override
  State<CartQuantityItem> createState() => _CartQuantityItemState();
}

class _CartQuantityItemState extends State<CartQuantityItem> {
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
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFF73888a), // Background color
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrease Button
            _buildButton(Icons.remove, _decrement),

            // Quantity Number
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                '$quantity',
                style: TextStyle(
                  fontSize: 15.sp,
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
        width: 25.w,
        height: 20.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Icon(
          icon,
          size: 15.r,
          color: const Color(0xFF577173), // Icon color
        ),
      ),
    );
  }
}
