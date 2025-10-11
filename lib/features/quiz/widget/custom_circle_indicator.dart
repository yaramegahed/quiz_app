import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/colors/colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    super.key,
    required this.outPutTime,
    required this.outPutAnimationProgress,
  });

  final Stream<double> outPutAnimationProgress;

  final Stream<int> outPutTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: StreamBuilder2(
        streams: StreamTuple2(outPutAnimationProgress, outPutTime),
        builder: (context, snapshots) => CircularPercentIndicator(
          animationDuration: 30000,
          restartAnimation: true,
          backgroundColor: AppColors.kCircleBG,
          radius: 40.0,
          lineWidth: 8,
          percent:
              snapshots.snapshot1.data == null ? 0 : snapshots.snapshot1.data!,
          center: Text(
            snapshots.snapshot2.data == null
                ? "0"
                : snapshots.snapshot2.data.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: AppColors.kCircleText),
          ),
          progressColor: AppColors.kPrimary,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ),
    );
  }
}
