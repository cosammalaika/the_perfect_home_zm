class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: 'Discover Your Perfect Home in Zambia',
    image: 'assets/images/perfect_home.png',
    desc:
        'Explore the ideal living spaces that match your lifestyle and preferences.',
  ),
  OnboardingContents(
    title: 'Create Harmony in Your Living Space',
    image: 'assets/images/harmony.png',
    desc:
        'Design and organize your perfect home for a harmonious living experience.',
  ),
  OnboardingContents(
    title: 'Receive Updates on Dream Properties',
    image: 'assets/images/notifications.png',
    desc:
        'Stay informed about the latest listings and updates for your dream home in Zambia.',
  ),
];
