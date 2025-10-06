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
    // TODO: implement initState
    super.initState();
    _onboardingController = OnboardingController();
  }

  @override
  void dispose() {
    _onboardingController.onDispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            onPageChanged: (int indexPosition) {
              _onboardingController.onTap(indexPosition);
              print(_onboardingController.currentPositionPage);
              // _onboardingController.currentPositionPage=value;
              // _onboardingController.onTap(value);
              // if (_onboardingController.isTapped == true) {
              //   if (_onboardingController.pageController.page!.round() ==
              //       _onboardingController.currentPositionPage) {
              //     _onboardingController.isTapped = false;
              //   }
              // } else {
              //   _onboardingController.onTap(value);
              // }
            },
            controller: _onboardingController.pageController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomPageViewBody(
                  image: item.image,
                  title: item.title,
                  subTitle: item.subtitle,
                ),
              );
            }),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: CustomBottomNavigationBar(
          outputData: _onboardingController.outputData,
          onTap: (indexPosition) {
            _onboardingController.isTapped = true;
            _onboardingController.onTap(indexPosition);
            _onboardingController.pageController
                .jumpToPage(_onboardingController.currentPositionPage);
          },
          nextOnTap: () {
            _onboardingController.nextOnTap();
            _onboardingController.pageController
                .jumpToPage(_onboardingController.currentPositionPage);
          },
        ),
      ),
    );
  }
}
