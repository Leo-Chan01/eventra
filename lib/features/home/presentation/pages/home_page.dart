import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_join_as_vendor_cta.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_featured.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_top_rated.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_week.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = '/home';
  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.currentIndex,
              children: [
                _HomeContent(state: state),
                const Center(child: Text('Enquiries Page')),
                const Center(child: Text('Search Page')),
                const Center(child: Text('Showcase Page')),
                const Center(child: Text('Profile Page')),
              ],
            ),
          ),
          bottomNavigationBar: EventraBottomNav(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(HomeTabChanged(index));
            },
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
          
          _SectionHeader(
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

          _SectionHeader(
            title: l10n.homeTopRatedVendors,
            onSeeAll: () {},
          ),
          16.vertSpacing,
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: state.vendors.length,
              separatorBuilder: (context, index) => 16.horizSpacing,
              itemBuilder: (context, index) {
                return VendorCardTopRated(vendor: state.vendors[index]);
              },
            ),
          ),
          24.vertSpacing,

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeJoinAsVendorCTA(),
          ),
          24.vertSpacing,

          _SectionHeader(
            title: l10n.homeVendorsOfTheWeek,
            onSeeAll: () {},
          ),
          16.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: state.vendors.map((vendor) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: VendorCardWeek(vendor: vendor),
                );
              }).toList(),
            ),
          ),
          80.vertSpacing, // Extra space for bottom nav
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.onSeeAll,
  });

  final String title;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: 18.bold.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: Text(
              l10n.homeSeeAll,
              style: 14.w500.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
