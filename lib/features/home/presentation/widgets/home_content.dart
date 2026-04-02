import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_join_as_vendor_cta.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/section_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_top_rated_carousel.dart';
import 'package:eventra/features/home/presentation/widgets/home_vendors_week_grid.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_featured.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({required this.state, super.key});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeHeader(userName: 'Maria'),
          ),
          24.vertSpacing,
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeSearchBar(),
          ),
          24.vertSpacing,
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomePromoBanner(),
          ),
          24.vertSpacing,
          HomeCategories(categories: state.categories),
          24.vertSpacing,

          SectionHeader(
            title: l10n.homeFeaturedVendors,
            onSeeAll: () {},
          ),
          16.vertSpacing,
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: state.vendors.length,
              separatorBuilder: (context, index) => 16.horizSpacing,
              itemBuilder: (context, index) {
                return VendorCardFeatured(vendor: state.vendors[index]);
              },
            ),
          ),
          24.vertSpacing,

          SectionHeader(
            title: l10n.homeTopRatedVendors,
            onSeeAll: () {},
          ),
          16.vertSpacing,
          HomeTopRatedCarousel(vendors: state.vendors),
          24.vertSpacing,

          SectionHeader(
            title: l10n.homeVendorsOfTheWeek,
            onSeeAll: () {},
          ),
          16.vertSpacing,
          HomeVendorsWeekGrid(vendors: state.vendors),
          24.vertSpacing,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeJoinAsVendorCTA(),
          ),
          80.vertSpacing,
        ],
      ),
    );
  }
}
