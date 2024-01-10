// onboarding_page.dart

import 'package:flutter/material.dart';
import 'header_widget.dart';
import 'content_widget.dart';
import 'image_section_widget.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;
  final VoidCallback? onSkipPressed;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    double paddingFactor = 1.0; // Adjust the value as needed

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50 * paddingFactor),
            ),
            child: Column(
              children: [
                HeaderWidget(paddingFactor),
                ContentWidget(paddingFactor, title, description),
                ImageSectionWidget(paddingFactor, imagePath),
                const SizedBox(height: 20.0),
                if (isLastPage)
                  ElevatedButton(
                    onPressed: onSkipPressed,
                    child: const Text('Get Started'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
