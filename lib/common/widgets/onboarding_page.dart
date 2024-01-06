import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/Light.png',
                height: 40.0,
                width: 40.0,
              ),
              if (!isLastPage)
                TextButton(
                  onPressed: onSkipPressed,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          
          Image.asset(
            imagePath,
            height: 600.0,
            width: 200.0,
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen or perform any action
              },
              child: const Text('Get Started'),
            ),
        ],
      ),
    );
  }
}
