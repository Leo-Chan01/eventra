import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_header.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_tab_bar.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorDetailBody extends StatelessWidget {
  const VendorDetailBody({
    required this.vendor,
    required this.tabs,
    required this.selectedTab,
    this.isVendorMode = false,
    super.key,
  });

  final VendorDetail vendor;
  final List<String> tabs;
  final int selectedTab;
  final bool isVendorMode;

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
          child: VendorDetailTabContent(
            vendor: vendor,
            selectedTab: selectedTab,
            isVendorMode: isVendorMode,
          ),
        ),
      ],
    );
  }
}
