import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_top_rated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllVendorsSingleFlushList extends StatelessWidget {
  const AllVendorsSingleFlushList({required this.vendors, super.key});

  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    if (vendors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: List.generate(vendors.length, (index) {
        final vendor = vendors[index];

        return Padding(
          padding: EdgeInsets.only(
            bottom: index == vendors.length - 1 ? 0 : 16,
            left: 16,
            right: 16,
          ),
          child: AspectRatio(
            aspectRatio: 16 / 12,
            child: VendorCardTopRated(
              vendor: vendor,
              onViewProfile: () async {
                context.read<VendorDetailBloc>().add(
                  VendorSelected(vendor.id),
                );
                await context.pushNamed(VendorDetailPage.name);
              },
            ),
          ),
        );
      }),
    );
  }
}
