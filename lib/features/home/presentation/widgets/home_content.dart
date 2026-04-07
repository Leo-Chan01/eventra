import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_join_as_vendor_cta.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/home_top_rated_carousel.dart';
import 'package:eventra/features/home/presentation/widgets/home_vendors_week_grid.dart';
import 'package:eventra/features/home/presentation/widgets/section_header.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_featured.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
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

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeHeader(userName: 'Maria'),
          ),
          20.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeSearchBar(
              onTapFilter: onOpenFilter,
              onTapSearch: onOpenLocationLookup,
            ),
          ),
          20.vertSpacing,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomePromoBanner(),
          ),
          20.vertSpacing,
          HomeCategories(
            categories: state.categories,
            selectedCategory: state.selectedCategory,
            onCategorySelected: (category) {
              context.read<HomeBloc>().add(HomeCategorySelected(category));
            },
          ),
          24.vertSpacing,
          SectionHeader(
            title: l10n.homeFeaturedVendors,
            onSeeAll: () {},
          ),
          12.vertSpacing,
          SizedBox(
            height: 252,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: state.vendors.length,
              separatorBuilder: (context, index) => 12.horizSpacing,
              itemBuilder: (context, index) {
                final vendor = state.vendors[index];
                return VendorCardFeatured(
                  vendor: vendor,
                  onTap: () {
                    context.read<VendorDetailBloc>().add(
                      VendorSelected(vendor.id),
                    );
                    context.pushNamed(VendorDetailPage.name);
                  },
                );
              },
            ),
          ),
          24.vertSpacing,
          SectionHeader(
            title: l10n.homeTopRatedVendors,
            onSeeAll: () {},
          ),
          12.vertSpacing,
          HomeTopRatedCarousel(vendors: state.vendors),
          24.vertSpacing,
          SectionHeader(
            title: l10n.homeVendorsOfTheWeek,
            onSeeAll: () {},
          ),
          12.vertSpacing,
          HomeVendorsWeekGrid(vendors: state.vendors),
          24.vertSpacing,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeJoinAsVendorCTA(),
          ),
        ],
      ),
    );
  }
}
