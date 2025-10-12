import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomCheckContainer extends StatelessWidget {
  const CustomCheckContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.kPrimary),
          shape: BoxShape.circle),
    );
  }
}
