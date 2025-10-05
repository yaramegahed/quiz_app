class OnboardingModel {
  String image;
  String title;
  String subtitle;

  OnboardingModel(
      {required this.image, required this.title, required this.subtitle});
}

List<OnboardingModel> data = [
  OnboardingModel(
      image: "assets/images/Frame.png",
      title: "Synonyms for QUIZ",
      subtitle: "Synonyms for QUIZ"),
  OnboardingModel(
      image: "assets/images/undraw_questions.png",
      title: "Synonyms for QUIZ",
      subtitle:
          "Sunt in culpa qui officia deserunt mollit anim idest laborum."),
  OnboardingModel(
      image: "assets/images/undraw_in.png",
      title: "Cool Quiz",
      subtitle: "Culpa qui officia deserunt mollit anim id est laborum."),
];
