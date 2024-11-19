class Doctor {
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final String image;

  Doctor({
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      locationOfCenter: json['location_of_center'],
      reviewRate: json['review_rate'],
      image: json['image'],
    );
  }
}