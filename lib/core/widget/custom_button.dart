import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isActive,
  });

  final void Function() onTap;
  final String title;
  final Stream<bool> isActive;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: isActive,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return GestureDetector(
            onTap: snapshot.data == null
                ? null
                : snapshot.data == true
                    ? onTap
                    : null,
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: snapshot.data==true
                      ? AppColors.kPrimary
                      : AppColors.kDotMain),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        });
  }
}
