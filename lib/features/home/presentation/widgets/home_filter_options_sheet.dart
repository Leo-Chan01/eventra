import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_category_chip.dart';
import 'package:eventra/features/home/presentation/widgets/home_filter_location_row.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilterOptionsSheet extends StatelessWidget {
  const HomeFilterOptionsSheet({
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
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.48),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              10.vertSpacing,
              // Center(
              //   child: Text(
              //     l10n.homeFilterTitle,
              //     style: 20.w700.copyWith(color: colorScheme.onSurface),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: HomeFilterLocationRow(
                  location: _extractCity(state.selectedAddress),
                  onOpenLocationLookup: onOpenLocationLookup,
                ),
              ),
              12.vertSpacing,
              Divider(
                color: colorScheme.outlineVariant.withValues(alpha: 0.20),
                height: 1,
              ),
              18.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.homeFilterCategories,
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    12.vertSpacing,
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: state.filterCategories
                          .map(
                            (category) => HomeCategoryChip(
                              label: category,
                              isSelected: state.selectedFilterCategories
                                  .contains(
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
                    24.vertSpacing,
                    Text(
                      l10n.homeFilterRating,
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    12.vertSpacing,
                    Wrap(
                      spacing: 16,
                      runSpacing: 10,
                      children: List.generate(5, (index) {
                        final rating = index + 1;

                        return HomeCategoryChip(
                          label: '$rating',
                          isSelected: state.selectedRating == rating,
                          onTap: () {
                            context.read<HomeBloc>().add(
                              HomeRatingChanged(rating),
                            );
                          },
                          hasIcon: true,
                          icon: EventraVectors.starVector,
                        );
                      }),
                    ),
                    24.vertSpacing,
                    Row(
                      children: [
                        Text(
                          l10n.homeFilterPriceRange,
                          style: 16.w700.copyWith(color: colorScheme.onSurface),
                        ),
                        const Spacer(),
                        Text(
                          _buildCompactRangeLabel(),
                          style: 16.w700.copyWith(color: colorScheme.primary),
                        ),
                      ],
                    ),
                    12.vertSpacing,
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: colorScheme.primary,
                        inactiveTrackColor: colorScheme.onSurfaceVariant
                            .withValues(
                              alpha: 0.24,
                            ),
                        thumbColor: colorScheme.primary,
                        overlayColor: colorScheme.primary.withValues(
                          alpha: 0.12,
                        ),
                        trackHeight: 1,
                      ),
                      child: RangeSlider(
                        values: RangeValues(state.minPrice, state.maxPrice),
                        min: 10000,
                        max: 2000000,

                        divisions: 199,
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
                    18.vertSpacing,
                    EventraButton(
                      buttonText: l10n.homeFilterShowResult,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildCompactRangeLabel() {
    return '${_formatCompactPrice(state.minPrice)}-${_formatCompactPrice(state.maxPrice)}';
  }

  String _extractCity(String address) {
    final parts = address.split(',');
    return parts.isEmpty ? address : parts.last.trim();
  }

  String _formatCompactPrice(double value) {
    if (value >= 1000000) {
      final millions = value / 1000000;
      final label = millions % 1 == 0
          ? millions.toStringAsFixed(0)
          : millions.toStringAsFixed(1);
      return '${label}M';
    }

    if (value >= 1000) {
      final thousands = value / 1000;
      final label = thousands % 1 == 0
          ? thousands.toStringAsFixed(0)
          : thousands.toStringAsFixed(1);
      return '${label}k';
    }

    return value.toStringAsFixed(0);
  }
}
