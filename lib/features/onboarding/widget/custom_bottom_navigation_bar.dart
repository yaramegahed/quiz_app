import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/features/login/view/login_screen.dart';

import '../../../core/colors/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.outputData,
    required this.nextOnTap,
  });

  final void Function(int) onTap;
  final void Function() nextOnTap;
  final Stream outputData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
          StreamBuilder(
            stream: outputData,
            builder: (context, snapshot) => DotsIndicator(
              decorator: DotsDecorator(
                  size: Size(12, 12),
                  activeSize: Size(12, 12),
                  activeColor: AppColors.kDotActive,
                  color: AppColors.kDotMain),
              onTap: onTap,
              dotsCount: 3,
              position:
                  snapshot.data == null ? 0.0 : (snapshot.data).toDouble(),
            ),
          ),
          InkWell(
            onTap: nextOnTap,
            child: Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
