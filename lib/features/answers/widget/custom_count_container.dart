import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomCountContainer extends StatelessWidget {
  const CustomCountContainer({
    super.key,
    required this.order,
    required this.isCorrect,
  });

  final int order;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 58,
      decoration: BoxDecoration(
          color: isCorrect == true ? AppColors.kGreen : AppColors.kRed,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20))),
      child: Center(
        child: Text(
          order.toString(),
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
