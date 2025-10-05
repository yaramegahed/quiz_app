import 'package:flutter/material.dart';
import 'package:quiz_app/features/onboarding/view/onboarding_screen.dart';

import '../../../core/colors/colors.dart';
import '../widget/custom_button.dart';

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
          CustomButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreen(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
