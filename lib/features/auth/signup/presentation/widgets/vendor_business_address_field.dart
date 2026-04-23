import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_location_lookup_view.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorBusinessAddressField extends StatelessWidget {
  const VendorBusinessAddressField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          previous.businessAddress != current.businessAddress,
      builder: (context, state) {
        return EventraGeneralTextfield(
          key: ValueKey('vendor_business_address_${state.businessAddress}'),
          label: l10n.vendorBusinessAddressLabel,
          hint: l10n.vendorBusinessAddressHint,
          initialValue: state.businessAddress,
          keyboardType: TextInputType.streetAddress,
          readOnly: true,
          onTap: () => _openLocationLookup(context),
        );
      },
    );
  }

  Future<void> _openLocationLookup(BuildContext context) async {
    final homeBloc = HomeBloc();

    try {
      await showCupertinoSheet<void>(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: homeBloc,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return FractionallySizedBox(
                  heightFactor: 0.98,
                  child: HomeLocationLookupView(
                    state: state,
                    showCloseAction: true,
                    closeOnSelect: true,
                    onLocationSelected: (address) {
                      context.read<SignupBloc>().add(
                        SignupBusinessAddressChanged(address),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      );
    } finally {
      await homeBloc.close();
    }
  }
}
