import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onPressed,
    super.key,
  });
final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}