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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _onboardingController = OnboardingController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _onboardingController.onDispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller:_pageController ,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return CustomPageViewBody(
                image: item.image,
                title: item.title,
                subTitle: item.subtitle,
              );
            }),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: CustomBottomNavigationBar(
          outputData: _onboardingController.outputData,
          onTap: (indexPosition) {
            _onboardingController.onTap(indexPosition);
            _pageController.jumpToPage(_onboardingController.currentPositionPage.toInt());
          },
          nextOnTap: () {
            _onboardingController.nextOnTap();
            _pageController.jumpToPage(_onboardingController.currentPositionPage.toInt());
          },
        ),
      ),
    );
  }
}
