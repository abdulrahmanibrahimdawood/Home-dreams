import 'package:home_dreams/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String reviewDescription;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescription,
    required this.rating,
  });
  factory ReviewModel.fromEntity(ReviewEntity entity) => ReviewModel(
    name: entity.name,
    image: entity.image,
    date: entity.date,
    reviewDescription: entity.reviewDescription,
    rating: entity.rating,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    date: json['date'],
    reviewDescription: json['reviewDescription'],
    rating: json['rating'],
  );
  toJson() => {
    'name': name,
    'image': image,
    'date': date,
    'reviewDescription': reviewDescription,
    'rating': rating,
  };
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      reviewDescription: reviewDescription,
      rating: rating,
    );
  }
}
