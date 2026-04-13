import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/all_vendors_single_flush_list.dart';
import 'package:flutter/material.dart';

class HomeSearchVendorsList extends StatelessWidget {
  const HomeSearchVendorsList({required this.vendors, super.key});

  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const Key('home_search_vendors_list'),
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 20),
      children: [
        AllVendorsSingleFlushList(vendors: vendors),
      ],
    );
  }
}
