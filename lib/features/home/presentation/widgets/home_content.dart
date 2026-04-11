import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/all_vendors_single_flush_list.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_join_as_vendor_cta.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // final l10n = context.l10n;
    // final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeHeader(
              userName: 'Maria',
              hasMessages: true,
              hasNotifications: true,
            ),
          ),
          20.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeSearchBar(
              onTapFilter: onOpenFilter,
              onTapSearch: () {
                //TODO(KINGRAYM): DO NOT REMOVE THIS implement search page and navigation
              },
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

          //TODO(KINGRAYM): DO NOT DELETE THE COMMENTED UI CODE BELOW, bring back when the featured and top rated vendors are figured our by management

          // 24.vertSpacing,
          // SectionHeader(
          //   title: l10n.homeFeaturedVendors,
          //   onSeeAll: () {},
          // ),
          // 12.vertSpacing,
          // AspectRatio(
          //   aspectRatio: 16 / 9,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 24),
          //     itemCount: state.vendors.length,
          //     separatorBuilder: (context, index) => 12.horizSpacing,
          //     itemBuilder: (context, index) {
          //       final vendor = state.vendors[index];
          //       return Padding(
          //         padding: const EdgeInsets.only(bottom: 8),
          //         child: VendorCardFeatured(
          //           vendor: vendor,
          //           onTap: () async {
          //             context.read<VendorDetailBloc>().add(
          //               VendorSelected(vendor.id),
          //             );
          //             await context.pushNamed(VendorDetailPage.name);
          //           },
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // 24.vertSpacing,
          // SectionHeader(
          //   title: l10n.homeTopRatedVendors,
          //   onSeeAll: () {},
          // ),
          // 12.vertSpacing,
          // HomeTopRatedCarousel(vendors: state.vendors),
          // 24.vertSpacing,
          // SectionHeader(
          //   title: l10n.homeVendorsOfTheWeek,
          //   onSeeAll: () {},
          // ),
          // 12.vertSpacing,
          // HomeVendorsWeekGrid(vendors: state.vendors),
          26.vertSpacing,
          AllVendorsSingleFlushList(vendors: state.allVendors),
          54.vertSpacing,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeJoinAsVendorCTA(),
          ),
        ],
      ),
    );
  }
}
