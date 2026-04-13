import 'package:equatable/equatable.dart';

class HomeSearchEventItem extends Equatable {
  const HomeSearchEventItem({
    required this.imagePath,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.dateTime,
  });

  final String imagePath;
  final String category;
  final String title;
  final String description;
  final String price;
  final String location;
  final String dateTime;

  @override
  List<Object?> get props => [
    imagePath,
    category,
    title,
    description,
    price,
    location,
    dateTime,
  ];
}
