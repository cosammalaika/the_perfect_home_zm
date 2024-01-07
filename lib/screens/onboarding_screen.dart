import 'package:flutter/material.dart';
import '../common/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            title: 'Welcome to The Perfect Home, swipe to',
            description: ' discover more',
            imagePath: 'assets/images/on_bording_images/img (1).jpg',
          ),
          OnboardingPage(
            title: 'Explore Features discover new places and',
            description: ' exciting great Homes',
            imagePath: 'assets/images/on_bording_images/img (3).jpg',
          ),
          OnboardingPage(
            title: 'Get Started and begin your search for a perfect Home',
            description: ' your journey ?',
            imagePath: 'assets/images/on_bording_images/img (4).jpg',
            isLastPage: true,
            onSkipPressed: () {
              // Navigate to the last onboarding screen
              _pageController
                  .jumpToPage(2); // Use jumpToPage instead of animateToPage
            },
          ),
        ],
      ),
    );
  }
}
