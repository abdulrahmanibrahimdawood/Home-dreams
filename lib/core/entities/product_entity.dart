import 'package:equatable/equatable.dart';
import 'package:home_dreams/core/entities/review_entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final num sellingCount;
  final List<ReviewEntity> reviews;
  const ProductEntity({
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
    required this.reviews,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    this.isOrganic = false,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.sellingCount,
  });

  @override
  List<Object?> get props => [code];
}
