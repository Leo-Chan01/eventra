import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_review.dart';

class RelatedVendor extends Equatable {
  const RelatedVendor({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.location,
    required this.rating,
  });

  final String id;
  final String name;
  final String image;
  final String category;
  final String location;
  final double rating;

  @override
  List<Object?> get props => [id, name, image, category, location, rating];
}

class VendorDetail extends Equatable {
  const VendorDetail({
    required this.id,
    required this.name,
    required this.bio,
    required this.tags,
    required this.rating,
    required this.reviewsCount,
    required this.coverImage,
    required this.profileImage,
    required this.location,
    required this.followersCount,
    required this.services,
    required this.catalogItems,
    required this.videoThumbnails,
    required this.reviews,
    required this.relatedVendors,
    this.isVerified = false,
    this.isTopRated = false,
    this.isIdVerified = false,
    this.isBackgroundChecked = false,
    this.hasVerificationBadge = false,
  });

  final String id;
  final String name;
  final String bio;
  final List<String> tags;
  final double rating;
  final int reviewsCount;
  final String coverImage;
  final String profileImage;
  final String location;
  final int followersCount;
  final List<String> services;
  final List<CatalogItem> catalogItems;
  final List<String> videoThumbnails;
  final List<VendorReview> reviews;
  final List<RelatedVendor> relatedVendors;
  final bool isVerified;
  final bool isTopRated;
  final bool isIdVerified;
  final bool isBackgroundChecked;
  final bool hasVerificationBadge;

  @override
  List<Object?> get props => [
    id,
    name,
    bio,
    tags,
    rating,
    reviewsCount,
    coverImage,
    profileImage,
    location,
    followersCount,
    services,
    catalogItems,
    videoThumbnails,
    reviews,
    relatedVendors,
    isVerified,
    isTopRated,
    isIdVerified,
    isBackgroundChecked,
    hasVerificationBadge,
  ];
}
