class Onboards {
  final String image;
  final String text;

  Onboards({required this.image, required this.text});
}

List<Onboards> onboards = [
  Onboards(
    image: 'assets/pets-image/image1.png',
    text: 'Join us and discover the best\npet in your location.',
  ),
  Onboards(
    image: 'assets/pets-image/image2.png',
    text: 'We help people connect with pet \naround your location.',
  ),
  Onboards(
    image: 'assets/pets-image/image3.png',
    text: 'We show the easy way to adopt pet. \nJust stay at home with us.',
  ),
];
