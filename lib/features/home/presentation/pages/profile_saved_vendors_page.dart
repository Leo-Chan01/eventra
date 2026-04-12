import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/profile_favorite_vendor_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSavedVendorsPage extends StatefulWidget {
  const ProfileSavedVendorsPage({super.key});

  static const String path = '/profile-saved-vendors';
  static const String name = 'profile-saved-vendors';

  @override
  State<ProfileSavedVendorsPage> createState() =>
      _ProfileSavedVendorsPageState();
}

class _ProfileSavedVendorsPageState extends State<ProfileSavedVendorsPage> {
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
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (_searchController.text != state.favoriteVendorQuery) {
          _searchController.value = TextEditingValue(
            text: state.favoriteVendorQuery,
            selection: TextSelection.collapsed(
              offset: state.favoriteVendorQuery.length,
            ),
          );
        }

        final filteredVendors = state.favoriteVendors.where((vendor) {
          final query = state.favoriteVendorQuery.trim().toLowerCase();
          if (query.isEmpty) {
            return true;
          }
          return vendor.name.toLowerCase().contains(query) ||
              vendor.category.toLowerCase().contains(query);
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
              l10n.profileSavedVendorsTitle,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              children: [
                ProfileSearchBar(
                  controller: _searchController,
                  hintText: l10n.profileSavedVendorsSearchHint,
                  onChanged: (value) {
                    context.read<HomeBloc>().add(
                      HomeFavoriteVendorSearchChanged(value),
                    );
                  },
                  onTapFilter: () {
                    GlobalSnackBar.showInfo(l10n.homeProfileActionComingSoon);
                  },
                ),
                16.vertSpacing,
                if (filteredVendors.isEmpty)
                  ProfileSurfaceCard(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          l10n.profileSavedVendorsEmptyState,
                          textAlign: TextAlign.center,
                          style: 15.w500.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  ...filteredVendors.map(
                    (vendor) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ProfileFavoriteVendorCard(
                        vendor: vendor,
                        removeLabel: l10n.profileSavedVendorsRemove,
                        viewProfileLabel: l10n.homeViewProfile,
                        onRemove: () {
                          context.read<HomeBloc>().add(
                            HomeFavoriteVendorRemoved(vendor.id),
                          );
                        },
                        onViewProfile: () {
                          GlobalSnackBar.showInfo(
                            l10n.notificationsActionComingSoon,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
