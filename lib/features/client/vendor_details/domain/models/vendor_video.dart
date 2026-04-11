import 'package:equatable/equatable.dart';

class VendorVideo extends Equatable {
  const VendorVideo({
    required this.thumbnailUrl,
    required this.viewCount,
  });

  final String thumbnailUrl;
  final int viewCount;

  @override
  List<Object?> get props => [thumbnailUrl, viewCount];
}
