import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.imgPath, this.isActive = false});
  final String imgPath;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 80,
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border:
            Border.all(color: isActive ? Colors.green : Colors.black, width: 2),
        boxShadow: [
          isActive
              ? BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              : const BoxShadow(),
        ],
      ),
      child: SvgPicture.asset(
        imgPath,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
