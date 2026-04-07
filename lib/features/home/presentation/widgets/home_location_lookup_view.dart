import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_category_chip.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLocationLookupView extends StatelessWidget {
  const HomeLocationLookupView({
    required this.state,
    this.showCloseAction = false,
    this.closeOnSelect = false,
    super.key,
  });

  final HomeState state;
  final bool showCloseAction;
  final bool closeOnSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final suggestions = state.locationQuery.isEmpty
        ? state.recentLocations
        : state.locationSuggestions;

    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.homeLocationLookupTitle,
                    style: 20.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                  if (showCloseAction)
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close_rounded,
                        color: colorScheme.onSurface,
                      ),
                    ),
                ],
              ),
              4.vertSpacing,
              Text(
                l10n.homeExploreNearbyVendors,
                style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              16.vertSpacing,
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  autofocus: showCloseAction,
                  onChanged: (value) {
                    context.read<HomeBloc>().add(
                      HomeLocationQueryChanged(value),
                    );
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: l10n.homeSearchByLocation,
                    icon: Icon(
                      Icons.search_rounded,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              16.vertSpacing,
              Text(
                l10n.homeYourCurrentAddress,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.28,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: colorScheme.primary,
                    ),
                    10.horizSpacing,
                    Expanded(
                      child: Text(
                        state.selectedAddress,
                        style: 14.w500.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                  ],
                ),
              ),
              16.vertSpacing,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.filterCategories
                    .take(6)
                    .map(
                      (category) => HomeCategoryChip(
                        label: category,
                        isSelected: state.selectedFilterCategories.contains(
                          category,
                        ),
                        onTap: () {
                          context.read<HomeBloc>().add(
                            HomeFilterCategoryToggled(category),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
              16.vertSpacing,
              Text(
                l10n.homeRecentLocations,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              12.vertSpacing,
              Expanded(
                child: ListView.separated(
                  itemCount: suggestions.length,
                  separatorBuilder: (_, _) => 8.vertSpacing,
                  itemBuilder: (context, index) {
                    final location = suggestions[index];

                    return InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(
                          HomeLocationSelected(location),
                        );
                        if (closeOnSelect) {
                          Navigator.of(context).pop();
                        }
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.22,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.near_me_rounded,
                              color: colorScheme.primary,
                              size: 18,
                            ),
                            10.horizSpacing,
                            Expanded(
                              child: Text(
                                location,
                                style: 13.w500.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
