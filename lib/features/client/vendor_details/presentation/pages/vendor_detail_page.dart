import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_about_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_bottom_bar.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_catalog_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_header.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_reviews_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_tab_bar.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_videos_tab.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VendorDetailPage extends StatelessWidget {
  const VendorDetailPage({
    this.args = const VendorDetailPageArgs(),
    super.key,
  });

  static const String path = '/vendor-detail';
  static const String name = 'vendor-detail';

  final VendorDetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    final tabs = [
      l10n.vendorDetailAbout,
      l10n.vendorDetailCatalog,
      l10n.vendorDetailVideos,
      l10n.vendorDetailReviews,
    ];

    return _VendorDetailEntry(
      args: args,
      child: BlocBuilder<VendorDetailBloc, VendorDetailState>(
        builder: (context, state) {
          final vendor = state.selectedVendor;

          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: _VendorDetailBody(
              vendor: vendor,
              tabs: tabs,
              selectedTab: state.selectedTab,
            ),
            bottomNavigationBar: args.isVendorMode
                ? null
                : VendorDetailBottomBar(
                    onMakeEnquiry: () => _onMakeEnquiry(context, vendor),
                  ),
          );
        },
      ),
    );
  }

  Future<void> _onMakeEnquiry(BuildContext context, VendorDetail vendor) async {
    if (vendor.catalogItems.isEmpty) {
      GlobalSnackBar.showInfo(context.l10n.notificationsActionComingSoon);
      return;
    }

    final firstCatalogItem = vendor.catalogItems.first;
    context.read<ClientBookingBloc>().add(
      EnquiryFormInitiated(
        vendorId: vendor.id,
        vendorName: vendor.name,
        catalogItem: firstCatalogItem,
      ),
    );

    await context.pushNamed(
      EnquiryFormPage.name,
      extra: EnquiryFormPageArgs(
        vendorId: vendor.id,
        vendorName: vendor.name,
        vendorImage: vendor.profileImage,
        catalogItem: firstCatalogItem,
        vendorCategory: vendor.services.isNotEmpty ? vendor.services.first : '',
        vendorRating: vendor.rating,
        vendorReviewsCount: vendor.reviewsCount,
      ),
    );
  }
}

class _VendorDetailEntry extends StatefulWidget {
  const _VendorDetailEntry({
    required this.args,
    required this.child,
  });

  final VendorDetailPageArgs args;
  final Widget child;

  @override
  State<_VendorDetailEntry> createState() => _VendorDetailEntryState();
}

class _VendorDetailEntryState extends State<_VendorDetailEntry> {
  bool _didSyncInitialState = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didSyncInitialState) {
      return;
    }

    final bloc = context.read<VendorDetailBloc>();
    final args = widget.args;

    if (args.vendorId != null && args.vendorId!.isNotEmpty) {
      bloc.add(VendorSelected(args.vendorId!));
    }

    if (args.initialTabIndex != 0) {
      bloc.add(VendorDetailTabChanged(args.initialTabIndex));
    }

    _didSyncInitialState = true;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _VendorDetailBody extends StatelessWidget {
  const _VendorDetailBody({
    required this.vendor,
    required this.tabs,
    required this.selectedTab,
  });

  final VendorDetail vendor;
  final List<String> tabs;
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: VendorDetailHeader(vendor: vendor),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: VendorDetailTabBar(
              tabs: tabs,
              selectedIndex: selectedTab,
              onTabSelected: (index) {
                context.read<VendorDetailBloc>().add(
                  VendorDetailTabChanged(index),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _TabContent(vendor: vendor, selectedTab: selectedTab),
        ),
      ],
    );
  }
}

class _TabContent extends StatelessWidget {
  const _TabContent({
    required this.vendor,
    required this.selectedTab,
  });

  final VendorDetail vendor;
  final int selectedTab;

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
      2 => VendorDetailVideosTab(videos: vendor.videos),
      _ => VendorDetailReviewsTab(
        rating: vendor.rating,
        reviewsCount: vendor.reviewsCount,
        reviews: vendor.reviews,
      ),
    };
  }
}
