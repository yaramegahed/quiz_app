import 'package:flutter/material.dart';
import 'package:quiz_app/features/onboarding/model/onboarding_model.dart';

import '../controller/onboarding_controller.dart';
import '../widget/custom_bottom_navigation_bar.dart';
import '../widget/custom_page_view_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingController _onboardingController;

  @override
  void initState() {

    super.initState();
    _onboardingController = OnboardingController();
  }

  @override
  void dispose() {
    _onboardingController.onDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount:data.length,
          itemBuilder: (context, index) {
            final item=data[index];
           return CustomPageViewBody(
              image:item.image,
              title: item.title,
              subTitle: item.subtitle,
            );}
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: CustomBottomNavigationBar(

          outputData: _onboardingController.outputData,
          onTap: (indexPosition) {
            _onboardingController.onTap(indexPosition);
          },
          nextOnTap: () {
            _onboardingController.nextOnTap();
          },
        ),
      ),
    );
  }
}
