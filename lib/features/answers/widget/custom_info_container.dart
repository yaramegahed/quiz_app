import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer({
    super.key, required this.name, required this.grade,
  });
final String name;
final String grade;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      width: double.infinity,
      height: 107,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Name : ",
                style: buildTextStyle(),
              ),
              Text(
                name,
                style: buildTextStyle(),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Grade : ",
                style: buildTextStyle(),
              ),
              Text(
                grade,
                style: buildTextStyle(fontWeight: FontWeight.w500)
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle({FontWeight? fontWeight}) {
    return TextStyle(
                  color: AppColors.kPrimary,
                  fontSize: 21,
                  fontFamily: "Montserrat",
                  fontWeight: fontWeight ??FontWeight.bold);
  }
}
