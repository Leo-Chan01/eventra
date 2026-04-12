//
// ignore_for_file: discarded_futures

import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 22),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Center(
                      child: SvgPicture.asset(
                        EventraVectors.goodCheckGreenDottedCircle,
                      ),
                    ),
                  ),
                  38.vertSpacing,
                  Text(
                    l10n.enquirySentTitle,
                    style: 24.w700.copyWith(color: colorScheme.onSurface),
                    textAlign: TextAlign.center,
                  ),
                  12.vertSpacing,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Text(
                      l10n.enquirySentMessage(state.enquiryVendorName),
                      style: 16.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(flex: 3),
                  EventraButton(
                    buttonText: l10n.enquirySentViewEnquiry,
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
                  28.vertSpacing,
                  InkWell(
                    onTap: () {
                      GlobalSnackBar.showInfo(
                        l10n.notificationsContactVendorFeedback,
                      );
                    },
                    borderRadius: BorderRadius.circular(999),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.surface,
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.5),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            EventraVectors.messagesChatBlackGrey,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        14.horizSpacing,
                        Text(
                          l10n.enquirySentMessageVendor,
                          style: 16.w500.copyWith(color: colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  8.vertSpacing,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
