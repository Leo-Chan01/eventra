import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_info_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePersonalInformationPage extends StatelessWidget {
  const ProfilePersonalInformationPage({super.key});

  static const String path = '/profile-personal-information';
  static const String name = 'profile-personal-information';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final profile = state.profile;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.homeProfilePersonalInformation,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(profile.avatarPath),
                ),
                10.vertSpacing,
                Text(
                  profile.fullName,
                  style: 16.w500.copyWith(color: colorScheme.onSurface),
                ),
                24.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfileFullNameLabel,
                  value: profile.legalName,
                ),
                12.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfilePhoneNumberLabel,
                  value: profile.phoneNumber,
                ),
                12.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfileGenderLabel,
                  value: profile.gender,
                ),
                12.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfileEmailLabel,
                  value: profile.email,
                ),
                12.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfileDateOfBirthLabel,
                  value: profile.dateOfBirth,
                ),
                12.vertSpacing,
                HomeProfileInfoCard(
                  label: l10n.homeProfileAddressLabel,
                  value: profile.address,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
