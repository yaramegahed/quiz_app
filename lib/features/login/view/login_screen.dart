import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/loginScreen.png")),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              const Center(
                child: Image(
                  image: AssetImage("assets/images/Q.png"),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "Enter your name",
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.kPrimary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(),
              Spacer(),
              CustomButton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

