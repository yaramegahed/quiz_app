import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Q",
              style: TextStyle(
                color: Colors.white,
                fontSize: 400,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
