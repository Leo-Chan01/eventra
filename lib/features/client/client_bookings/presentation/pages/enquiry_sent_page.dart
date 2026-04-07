import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class EnquirySentPage extends StatelessWidget {
  const EnquirySentPage({super.key});

  static const String path = '/enquiry-sent';
  static const String name = 'enquiry-sent';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientBookingBloc, ClientBookingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedSent,
                      size: 36,
                      color: colorScheme.primary,
                    ),
                  ),
                  24.vertSpacing,
                  Text(
                    l10n.enquirySentTitle,
                    style: 22.w700.copyWith(color: colorScheme.onSurface),
                    textAlign: TextAlign.center,
                  ),
                  12.vertSpacing,
                  Text(
                    l10n.enquirySentMessage(state.enquiryVendorName),
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  32.vertSpacing,
                  EventraButton.outlined(
                    buttonText: l10n.enquirySentViewProfile,
                    onPressed: () {
                      context.read<VendorDetailBloc>().add(
                        VendorSelected(state.enquiryVendorId),
                      );
                      context
                        ..pop()
                        ..pop()
                        ..pushNamed(VendorDetailPage.name);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
