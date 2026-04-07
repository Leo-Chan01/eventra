import 'package:equatable/equatable.dart';

class Enquiry extends Equatable {
  const Enquiry({
    required this.id,
    required this.vendorId,
    required this.vendorName,
    required this.catalogItemTitle,
    required this.message,
  });

  final String id;
  final String vendorId;
  final String vendorName;
  final String catalogItemTitle;
  final String message;

  @override
  List<Object?> get props => [
    id,
    vendorId,
    vendorName,
    catalogItemTitle,
    message,
  ];
}
