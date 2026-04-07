import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_video_thumbnail.dart';
import 'package:flutter/material.dart';

class VendorDetailVideosTab extends StatelessWidget {
  const VendorDetailVideosTab({
    required this.videoThumbnails,
    super.key,
  });

  final List<String> videoThumbnails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: videoThumbnails.length,
        itemBuilder: (context, index) {
          return VendorVideoThumbnail(
            imageUrl: videoThumbnails[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
