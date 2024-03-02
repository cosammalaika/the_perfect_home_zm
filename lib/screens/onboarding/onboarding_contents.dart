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
      title: 'Search for Your Ideal Home',
      image: 'assets/images/image1.png',
      desc: 'Explore a variety of homes to find the one that suits you best.'),
  OnboardingContents(
      title: 'Find Your Dream Home',
      image: 'assets/images/image2.png',
      desc: 'Locate the ideal property that meets all your needs and desires.'),
  OnboardingContents(
      title: 'Move In and Make It Yours',
      image: 'assets/images/image3.png',
      desc: 'Take the next step towards your dream home in Zambia.')
];
