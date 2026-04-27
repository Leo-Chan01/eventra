import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_detail_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/add_service_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/add_service_page.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_about_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_catalog_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_reviews_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_videos_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VendorDetailTabContent extends StatelessWidget {
  const VendorDetailTabContent({
    required this.vendor,
    required this.selectedTab,
    this.isVendorMode = false,
    super.key,
  });

  final VendorDetail vendor;
  final int selectedTab;
  final bool isVendorMode;

  @override
  Widget build(BuildContext context) {
    return switch (selectedTab) {
      0 => VendorDetailAboutTab(
        vendor: vendor,
        onRelatedVendorTap: (related) {
          final _ = context.read<VendorDetailBloc>()
            ..add(VendorSelected(related.id));
        },
      ),
      1 => VendorDetailCatalogTab(
        items: vendor.catalogItems,
        isVendorMode: isVendorMode,
        onAddTap: isVendorMode
            ? () async {
                await context.pushNamed(
                  AddServicePage.name,
                  extra: const AddServicePageArgs(
                    initialTab: AddServiceTab.catalog,
                  ),
                );
              }
            : null,
        onItemTap: (item) async {
          await context.pushNamed(
            CatalogItemDetailPage.name,
            extra: CatalogItemDetailArgs(
              catalogItem: item,
              vendorId: vendor.id,
              vendorName: vendor.name,
              vendorImage: vendor.profileImage,
            ),
          );
        },
      ),
      2 => VendorDetailVideosTab(
        isVendorMode: isVendorMode,
        onAddTap: isVendorMode
            ? () async {
                await context.pushNamed(
                  AddServicePage.name,
                  extra: const AddServicePageArgs(
                    initialTab: AddServiceTab.video,
                  ),
                );
              }
            : null,
        videos: vendor.videos,
      ),
      _ => VendorDetailReviewsTab(
        rating: vendor.rating,
        reviewsCount: vendor.reviewsCount,
        reviews: vendor.reviews,
      ),
    };
  }
}
