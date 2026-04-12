import 'package:equatable/equatable.dart';

class Enquiry extends Equatable {
  const Enquiry({
    required this.id,
    required this.vendorId,
    required this.vendorName,
    required this.catalogItemTitle,
    required this.message,
    this.eventType,
    this.location,
    this.guestCount,
    this.budget,
    this.eventDate,
    this.notes,
    this.imageUrls = const [],
  });

  final String id;
  final String vendorId;
  final String vendorName;
  final String catalogItemTitle;
  final String message;
  final String? eventType;
  final String? location;
  final int? guestCount;
  final String? budget;
  final DateTime? eventDate;
  final String? notes;
  final List<String> imageUrls;

  Enquiry copyWith({
    String? id,
    String? vendorId,
    String? vendorName,
    String? catalogItemTitle,
    String? message,
    String? eventType,
    String? location,
    int? guestCount,
    String? budget,
    DateTime? eventDate,
    String? notes,
    List<String>? imageUrls,
  }) {
    return Enquiry(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      catalogItemTitle: catalogItemTitle ?? this.catalogItemTitle,
      message: message ?? this.message,
      eventType: eventType ?? this.eventType,
      location: location ?? this.location,
      guestCount: guestCount ?? this.guestCount,
      budget: budget ?? this.budget,
      eventDate: eventDate ?? this.eventDate,
      notes: notes ?? this.notes,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  @override
  List<Object?> get props => [
    id,
    vendorId,
    vendorName,
    catalogItemTitle,
    message,
    eventType,
    location,
    guestCount,
    budget,
    eventDate,
    notes,
    imageUrls,
  ];
}
