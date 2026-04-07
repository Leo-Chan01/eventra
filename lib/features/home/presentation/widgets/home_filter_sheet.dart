import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_category_chip.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilterSheet extends StatelessWidget {
  const HomeFilterSheet({
    required this.state,
    required this.onOpenLocationLookup,
    super.key,
  });

  final HomeState state;
  final VoidCallback onOpenLocationLookup;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.homeFilterTitle,
                    style: 20.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              8.vertSpacing,
              Text(
                l10n.homeYourCurrentAddress,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              InkWell(
                key: const Key('home_location_field'),
                onTap: onOpenLocationLookup,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.32,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: colorScheme.primary,
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          state.selectedAddress,
                          style: 14.w500.copyWith(color: colorScheme.onSurface),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
              20.vertSpacing,
              Text(
                l10n.homeFilterCategories,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              12.vertSpacing,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.filterCategories
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
              20.vertSpacing,
              Text(
                l10n.homeFilterRating,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              12.vertSpacing,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  5,
                  (index) => HomeCategoryChip(
                    label: '${index + 1}+',
                    isSelected: state.selectedRating == index + 1,
                    onTap: () {
                      context.read<HomeBloc>().add(
                        HomeRatingChanged(index + 1),
                      );
                    },
                  ),
                ),
              ),
              20.vertSpacing,
              Text(
                l10n.homeFilterPriceRange,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Row(
                children: [
                  Text(
                    state.minPrice.getValue,
                    style: 12.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    state.maxPrice.getValue,
                    style: 12.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: colorScheme.primary,
                  inactiveTrackColor: colorScheme.primary.withValues(
                    alpha: 0.18,
                  ),
                  thumbColor: colorScheme.primary,
                  overlayColor: colorScheme.primary.withValues(alpha: 0.12),
                ),
                child: RangeSlider(
                  values: RangeValues(state.minPrice, state.maxPrice),
                  min: 10000,
                  max: 500000,
                  divisions: 49,
                  onChanged: (value) {
                    context.read<HomeBloc>().add(
                      HomePriceRangeChanged(
                        minPrice: value.start,
                        maxPrice: value.end,
                      ),
                    );
                  },
                ),
              ),
              16.vertSpacing,
              EventraButton(
                buttonText: l10n.homeFilterShowResult,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
