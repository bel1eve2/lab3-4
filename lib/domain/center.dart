class Center2 {
  final String title;
  final String locationName;
  final double reviewRate;
  final int countReviews;
  final double distanceKm;
  final int distanceMinutes;
  final String image;

  Center2({
    required this.title,
    required this.locationName,
    required this.reviewRate,
    required this.countReviews,
    required this.distanceKm,
    required this.distanceMinutes,
    required this.image,
  });

  factory Center2.fromJson(Map<String, dynamic> json) {
    return Center2(
      title: json['title'],
      locationName: json['location_name'],
      reviewRate: json['review_rate'],
      countReviews: json['count_reviews'],
      distanceKm: json['distance_km'],
      distanceMinutes: json['distance_minutes'],
      image: json['image'],
    );
  }
}