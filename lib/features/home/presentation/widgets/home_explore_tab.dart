import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/section_header.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_featured.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeExploreTab extends StatelessWidget {
  const HomeExploreTab({
    required this.state,
    required this.onOpenFilter,
    required this.onOpenLocationLookup,
    super.key,
  });

  final HomeState state;
  final VoidCallback onOpenFilter;
  final VoidCallback onOpenLocationLookup;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeExploreNearbyVendors,
            style: 24.w700.copyWith(color: colorScheme.onSurface),
          ),
          6.vertSpacing,
          Text(
            state.selectedAddress,
            style: 14.w500.copyWith(color: colorScheme.primary),
          ),
          20.vertSpacing,
          HomeSearchBar(
            onTapFilter: onOpenFilter,
            onTapSearch: onOpenLocationLookup,
          ),
          16.vertSpacing,
          HomeCategories(
            categories: state.categories,
            selectedCategory: state.selectedCategory,
            onCategorySelected: (category) {
              context.read<HomeBloc>().add(HomeCategorySelected(category));
            },
          ),
          20.vertSpacing,
          SectionHeader(
            title: l10n.homeFeaturedVendors,
            onSeeAll: () {},
          ),
          12.vertSpacing,
          Column(
            children: state.vendors
                .take(3)
                .map(
                  (vendor) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: VendorCardFeatured(vendor: vendor),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
