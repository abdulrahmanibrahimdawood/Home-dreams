import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/helper_funcations/get_avg_rating.dart';
import 'package:home_dreams/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    this.imageUrl,
    required this.numberOfCalories,
    required this.isOrganic,
    required this.unitAmount,
    required this.reviews,
    required this.expirationMonths,
    required this.name,
    required this.sellingCount,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    required this.avgRating,
    this.ratingCount = 0,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(
        (json['reviews'] as List<dynamic>)
            .map((e) => ReviewModel.fromJson(e).toEntity())
            .toList(),
      ),
      name: json['name'],
      description: json['description'],
      code: json['code'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      sellingCount: json['sellingCount'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
    );
  }
  toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      code: code,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      avgRating: avgRating,
      ratingCount: ratingCount,
      sellingCount: sellingCount,
    );
  }
}
