import 'package:eventra/features/client/vendor_details/domain/models/vendor_video.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_video_thumbnail.dart';
import 'package:flutter/material.dart';

class VendorDetailVideosTab extends StatelessWidget {
  const VendorDetailVideosTab({
    required this.videos,
    super.key,
  });

  final List<VendorVideo> videos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return VendorVideoThumbnail(
            imageUrl: video.thumbnailUrl,
            viewCount: video.viewCount,
            onTap: () {},
          );
        },
      ),
    );
  }
}
