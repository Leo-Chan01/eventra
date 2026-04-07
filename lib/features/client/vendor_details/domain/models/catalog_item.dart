import 'package:equatable/equatable.dart';

class CatalogItem extends Equatable {
  const CatalogItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.whatToExpect,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final List<String> whatToExpect;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    image,
    whatToExpect,
  ];
}
