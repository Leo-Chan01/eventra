import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.name,
    this.icon = '',
  });

  final String name;
  final String icon;

  @override
  List<Object?> get props => [name, icon];
}

class Vendor extends Equatable {
  const Vendor({
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewsCount,
    required this.image,
    required this.location,
    required this.startingPrice,
    this.isFavorite = false,
  });

  final String name;
  final String category;
  final double rating;
  final int reviewsCount;
  final String image;
  final String location;
  final double startingPrice;
  final bool isFavorite;

  @override
  List<Object?> get props => [
    name,
    category,
    rating,
    reviewsCount,
    image,
    location,
    startingPrice,
    isFavorite,
  ];
}
