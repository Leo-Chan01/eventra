import 'package:equatable/equatable.dart';

class HomeProfile extends Equatable {
  const HomeProfile({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.memberSince,
    required this.avatarPath,
    required this.bookingsCount,
    required this.reviewsCount,
    required this.favoritesCount,
    required this.legalName,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
  });

  final String fullName;
  final String email;
  final String phoneNumber;
  final String location;
  final String memberSince;
  final String avatarPath;
  final int bookingsCount;
  final int reviewsCount;
  final int favoritesCount;
  final String legalName;
  final String gender;
  final String dateOfBirth;
  final String address;

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
    location,
    memberSince,
    avatarPath,
    bookingsCount,
    reviewsCount,
    favoritesCount,
    legalName,
    gender,
    dateOfBirth,
    address,
  ];
}
