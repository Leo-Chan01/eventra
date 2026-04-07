import 'package:equatable/equatable.dart';

class VendorReview extends Equatable {
  const VendorReview({
    required this.id,
    required this.reviewerName,
    required this.reviewerAvatar,
    required this.rating,
    required this.date,
    required this.body,
  });

  final String id;
  final String reviewerName;
  final String reviewerAvatar;
  final double rating;
  final String date;
  final String body;

  @override
  List<Object?> get props => [
    id,
    reviewerName,
    reviewerAvatar,
    rating,
    date,
    body,
  ];
}
