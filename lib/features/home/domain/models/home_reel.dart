import 'package:equatable/equatable.dart';

class HomeReel extends Equatable {
  const HomeReel({
    required this.id,
    required this.title,
    required this.caption,
    required this.imagePath,
    required this.creatorAvatarPath,
    required this.viewCount,
    required this.likeCount,
    required this.shareCount,
    required this.saveCount,
  });

  final String id;
  final String title;
  final String caption;
  final String imagePath;
  final String creatorAvatarPath;
  final int viewCount;
  final int likeCount;
  final int shareCount;
  final int saveCount;

  @override
  List<Object?> get props => [
    id,
    title,
    caption,
    imagePath,
    creatorAvatarPath,
    viewCount,
    likeCount,
    shareCount,
    saveCount,
  ];
}
