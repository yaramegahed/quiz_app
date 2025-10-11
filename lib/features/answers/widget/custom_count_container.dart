import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomCountContainer extends StatelessWidget {
  const CustomCountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 58,
      decoration: BoxDecoration(
          color: AppColors.kGreen,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20))),
      child: Center(
        child: Text(
          "1",
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ),
    );
  }
}
