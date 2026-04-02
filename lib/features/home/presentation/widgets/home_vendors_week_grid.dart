import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_week.dart';
import 'package:flutter/material.dart';

class HomeVendorsWeekGrid extends StatelessWidget {
  const HomeVendorsWeekGrid({required this.vendors, super.key});

  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    if (vendors.isEmpty) return const SizedBox.shrink();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vendors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        return VendorCardWeek(vendor: vendors[index]);
      },
    );
  }
}
