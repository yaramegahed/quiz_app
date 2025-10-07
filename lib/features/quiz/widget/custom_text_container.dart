import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 30,
                spreadRadius: -1)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        "In what year did the United States host the FIFA World Cup for the first time?",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            wordSpacing: -2),
      ),
    );
  }
}
