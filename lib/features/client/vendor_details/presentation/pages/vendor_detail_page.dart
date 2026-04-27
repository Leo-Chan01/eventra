import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_body.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_bottom_bar.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_entry.dart';
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

    return VendorDetailEntry(
      args: args,
      child: BlocBuilder<VendorDetailBloc, VendorDetailState>(
        builder: (context, state) {
          final vendor = state.selectedVendor;

          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: VendorDetailBody(
              vendor: vendor,
              tabs: tabs,
              selectedTab: state.selectedTab,
              isVendorMode: args.isVendorMode,
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
