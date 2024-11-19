class Banner2 {
  final String title;
  final String description;
  final String image;

  Banner2({required this.title, required this.description, required this.image});

  factory Banner2.fromJson(Map<String, dynamic> json) {
    return Banner2(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
