import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_business_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_category_option_chip.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const vendorSignupCategories = <({String imagePath, String label})>[
  (imagePath: EventraImages.eventplannerCategoryImage, label: 'Event Planner'),
  (imagePath: EventraImages.cakesCategoryIcon, label: 'Cakes'),
  (imagePath: EventraImages.hallCategoryImage, label: 'Hall'),
  (imagePath: EventraImages.decoratorCategoryIcon, label: 'Decorator'),
  (imagePath: EventraImages.ligntningCategoryImage, label: 'Lightning'),
  (imagePath: EventraImages.drinksCategoryImage, label: 'Drinks'),
  (imagePath: EventraImages.weddingDressCategoryImage, label: 'Wedding Dress'),
  (imagePath: EventraImages.rentalCategoryIcon, label: 'Rental'),
  (imagePath: EventraImages.djCategoryImage, label: 'DJ'),
  (imagePath: EventraImages.makeUpCategoryImage, label: 'Make-up'),
  (imagePath: EventraImages.videographerCategoryImage, label: 'Videographer'),
  (imagePath: EventraImages.mcCategoryImage, label: 'MC'),
  (imagePath: EventraImages.bouncersCategoryImage, label: 'Bouncers'),
  (
    imagePath: EventraImages.weddingStylistCategoryImage,
    label: 'Wedding Stylist',
  ),
  (imagePath: EventraImages.smallChopsCategoryImage, label: 'Small Chops'),
  (imagePath: EventraImages.liveBandCategoryImage, label: 'Live Band'),
  (imagePath: EventraImages.hairStylistCategoryImage, label: 'Hair Stylist'),
  (imagePath: EventraImages.catererCategoryImage, label: 'Caterer'),
  (imagePath: EventraImages.photographyCategoryImage, label: 'Photography'),
  (imagePath: EventraImages.usherCategoryImage, label: 'Usher'),
  (
    imagePath: EventraImages.contentCreatorCategoryImage,
    label: 'Content Creator',
  ),
];

class VendorCategorySelectionBody extends StatelessWidget {
  const VendorCategorySelectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.vendorCategorySelectionTitle,
                      style: 32.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    12.vertSpacing,
                    Text(
                      l10n.vendorCategorySelectionSubtitle,
                      style: 16.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              28.vertSpacing,
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 18,
                    children: [
                      for (final category in vendorSignupCategories)
                        VendorCategoryOptionChip(
                          label: category.label,
                          imagePath: category.imagePath,
                          isSelected:
                              state.selectedVendorCategory == category.label,
                          onTap: () => context.read<SignupBloc>().add(
                            SignupVendorCategoryChanged(category.label),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              24.vertSpacing,
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: state.selectedVendorCategory == null
                    ? null
                    : () {
                        unawaited(
                          context.pushNamed(VendorBusinessDetailsPage.name),
                        );
                      },
              ),
              24.vertSpacing,
            ],
          ),
        );
      },
    );
  }
}
