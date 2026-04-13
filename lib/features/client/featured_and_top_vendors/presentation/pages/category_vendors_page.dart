import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/featured_and_top_vendors/presentation/widgets/category_vendor_card.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/profile_search_bar.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryVendorsPage extends StatefulWidget {
  const CategoryVendorsPage({required this.categoryName, super.key});

  static const String path = '/category-vendors';
  static const String name = 'category-vendors';

  final String categoryName;

  @override
  State<CategoryVendorsPage> createState() => _CategoryVendorsPageState();
}

class _CategoryVendorsPageState extends State<CategoryVendorsPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final categoryVendors = _resolveCategoryVendors(state);
        final filteredVendors = categoryVendors.where((vendor) {
          final query = _searchController.text.trim().toLowerCase();
          if (query.isEmpty) {
            return true;
          }

          return vendor.name.toLowerCase().contains(query) ||
              vendor.category.toLowerCase().contains(query) ||
              vendor.location.toLowerCase().contains(query);
        }).toList();

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: SvgPicture.asset(
                EventraVectors.angleRight,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: Text(
              widget.categoryName,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileSearchBar(
                  controller: _searchController,
                  hintText: l10n.homeSearchPlaceholder,
                  onChanged: (_) => setState(() {}),
                  onTapFilter: () {
                    GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon);
                  },
                ),
                28.vertSpacing,
                Text(
                  l10n.categoryVendorsFeaturedCount(categoryVendors.length),
                  style: 20.w700.copyWith(color: colorScheme.onSurface),
                ),
                24.vertSpacing,
                if (filteredVendors.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            EventraImages.searchResultNotFoundImage,
                            width: 220,
                            fit: BoxFit.contain,
                          ),
                          14.vertSpacing,
                          Text(
                            l10n.categoryVendorsEmptyState,
                            textAlign: TextAlign.center,
                            style: 15.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...filteredVendors.map(
                    (vendor) => Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: CategoryVendorCard(vendor: vendor),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Vendor> _resolveCategoryVendors(HomeState state) {
    final mergedVendors = [
      ...state.favoriteVendors,
      ...state.allVendors,
    ];
    final uniqueVendors = <Vendor>[];

    for (final vendor in mergedVendors) {
      final alreadyAdded = uniqueVendors.any((item) => item.id == vendor.id);
      if (!alreadyAdded) {
        uniqueVendors.add(vendor);
      }
    }

    final matchedVendors = uniqueVendors.where((vendor) {
      return _matchesSelectedCategory(vendor.category, widget.categoryName);
    }).toList();

    if (matchedVendors.length >= 3) {
      return matchedVendors;
    }

    final remainingVendors = uniqueVendors.where((vendor) {
      return matchedVendors.every((item) => item.id != vendor.id);
    });

    return [...matchedVendors, ...remainingVendors];
  }

  bool _matchesSelectedCategory(
    String vendorCategory,
    String selectedCategory,
  ) {
    final normalizedVendorCategory = _normalizeValue(vendorCategory);
    final normalizedSelectedCategory = _normalizeValue(selectedCategory);

    if (normalizedVendorCategory.contains(normalizedSelectedCategory) ||
        normalizedSelectedCategory.contains(normalizedVendorCategory)) {
      return true;
    }

    return switch (normalizedSelectedCategory) {
      'decorator' =>
        normalizedVendorCategory.contains('decor') ||
            normalizedVendorCategory.contains('decoration'),
      'rental' => normalizedVendorCategory.contains('rent'),
      'photography' => normalizedVendorCategory.contains('photo'),
      'dj' => normalizedVendorCategory.contains('dj'),
      _ => false,
    };
  }

  String _normalizeValue(String value) {
    return value.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  }
}
