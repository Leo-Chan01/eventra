import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_action_bar.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_detail_header.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_expect_section.dart';
import 'package:eventra/features/client/client_inbox/presentation/utils/vendor_chat_navigation.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/circle_action_button.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatalogItemDetailArgs {
  const CatalogItemDetailArgs({
    required this.catalogItem,
    required this.vendorId,
    required this.vendorName,
    required this.vendorImage,
  });

  final CatalogItem catalogItem;
  final String vendorId;
  final String vendorName;
  final String vendorImage;
}

class CatalogItemDetailPage extends StatelessWidget {
  const CatalogItemDetailPage({super.key});

  static const String path = '/catalog-item-detail';
  static const String name = 'catalog-item-detail';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final args = GoRouterState.of(context).extra! as CatalogItemDetailArgs;

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
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleActionButton(
                                icon: EventraVectors.loveButtonVendorDeets,
                                onPressed: () async =>
                                    Navigator.of(context).maybePop(),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  CircleActionButton(
                                    icon: EventraVectors.loveVendorDeets,
                                    onPressed: () async {
                                      await AppShareBottomSheet.show(
                                        context,
                                        shareText:
                                            '${args.vendorName} on Eventra',
                                      );
                                    },
                                  ),
                                  CircleActionButton(
                                    icon: EventraVectors.shareButtonVendorDeets,
                                    onPressed: () async {
                                      await AppShareBottomSheet.show(
                                        context,
                                        shareText:
                                            '${args.vendorName} on Eventra',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
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
    await openVendorChat(
      context: context,
      vendorId: args.vendorId,
      vendorName: args.vendorName,
      catalogItem: args.catalogItem,
    );
  }

  Future<void> _onMakeEnquiry(
    BuildContext context,
    CatalogItemDetailArgs args,
  ) async {
    context.read<ClientBookingBloc>().add(
      EnquiryFormInitiated(
        vendorId: args.vendorId,
        vendorName: args.vendorName,
        catalogItem: args.catalogItem,
      ),
    );
    final enquiryFormArgs = EnquiryFormPageArgs(
      vendorId: args.vendorId,
      vendorName: args.vendorName,
      vendorImage: args.vendorImage,
      catalogItem: args.catalogItem,
    );
    if (context.mounted) {
      await context.pushNamed(
        EnquiryFormPage.name,
        extra: enquiryFormArgs,
      );
    }
  }
}
