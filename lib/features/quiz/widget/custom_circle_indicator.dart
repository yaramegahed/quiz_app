import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/colors/colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, shape: BoxShape.circle),
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 30000,
        restartAnimation: true,
        backgroundColor: AppColors.kCircleBG,
        radius: 40.0,
        lineWidth: 8,
        percent: 1.0,
        center: Text(
          "30",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: AppColors.kCircleText),
        ),
        progressColor: AppColors.kPrimary,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
