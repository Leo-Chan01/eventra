import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_action_bar.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_detail_header.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_expect_section.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/client_inbox_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatalogItemDetailArgs {
  const CatalogItemDetailArgs({
    required this.catalogItem,
    required this.vendorId,
    required this.vendorName,
  });

  final CatalogItem catalogItem;
  final String vendorId;
  final String vendorName;
}

class CatalogItemDetailPage extends StatelessWidget {
  const CatalogItemDetailPage({super.key});

  static const String path = '/catalog-item-detail';
  static const String name = 'catalog-item-detail';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final args = GoRouterState.of(context).extra as CatalogItemDetailArgs;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CatalogItemDetailHeader(
                      item: args.catalogItem,
                      vendorName: args.vendorName,
                    ),
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).maybePop(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: colorScheme.surface.withValues(
                                alpha: 0.85,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 18,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 160),
                  child: CatalogItemExpectSection(
                    points: args.catalogItem.whatToExpect,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CatalogItemActionBar(
        onMessageVendor: () => _onMessageVendor(context, args),
        onMakeEnquiry: () => _onMakeEnquiry(context, args),
      ),
    );
  }

  Future<void> _onMessageVendor(
    BuildContext context,
    CatalogItemDetailArgs args,
  ) async {
    context.read<ClientInboxBloc>().add(
      InboxVendorStarted(
        vendorId: args.vendorId,
        vendorName: args.vendorName,
        catalogItem: args.catalogItem,
      ),
    );
    await context.pushNamed(ClientInboxPage.name);
  }

  Future<void> _onMakeEnquiry(
    BuildContext context,
    CatalogItemDetailArgs args,
  ) async {
    context.read<ClientBookingBloc>().add(
      EnquirySubmitted(
        vendorId: args.vendorId,
        vendorName: args.vendorName,
        catalogItem: args.catalogItem,
      ),
    );
    await context.pushNamed(EnquirySentPage.name);
  }
}
