import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_rating_stars.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileRateUsPage extends StatelessWidget {
  const ProfileRateUsPage({super.key});

  static const String path = '/profile-rate-us';
  static const String name = 'profile-rate-us';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: SvgPicture.asset(
                EventraVectors.angleLeft,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: Text(
              l10n.profileRateUsTitle,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              children: [
                ProfileDetailHeaderCard(
                  iconPath:
                      EventraVectors.weLoveYourFeedbackIconProfileSettings,
                  title: l10n.profileRateUsHeaderTitle,
                  subtitle: l10n.profileRateUsHeaderSubtitle,
                ),
                18.vertSpacing,
                ProfileSurfaceCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 28,
                  ),
                  child: Column(
                    children: [
                      Text(
                        l10n.profileRateUsPromptTitle,
                        textAlign: TextAlign.center,
                        style: 18.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      10.vertSpacing,
                      Text(
                        l10n.profileRateUsPromptSubtitle,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      20.vertSpacing,
                      ProfileRatingStars(
                        rating: state.appFeedbackRating,
                        onRatingSelected: (rating) {
                          context.read<HomeBloc>().add(
                            HomeAppFeedbackRated(rating),
                          );
                          GlobalSnackBar.showInfo(
                            l10n.profileRateUsFeedbackSubmitted,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                26.vertSpacing,
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 42,
                  color: colorScheme.onSurfaceVariant,
                ),
                12.vertSpacing,
                Text(
                  l10n.profileRateUsFooterTitle,
                  textAlign: TextAlign.center,
                  style: 16.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                8.vertSpacing,
                Text(
                  l10n.profileRateUsFooterSubtitle,
                  textAlign: TextAlign.center,
                  style: 13.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
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
