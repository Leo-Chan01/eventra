import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_event_seed.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_events_list.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_tab_selector.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_text_field.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_vendors_list.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({required this.state, super.key});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final events = HomeSearchEventSeed.fromL10n(l10n);

    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          key: const Key('home_search_page'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Text(
                l10n.navSearch,
                style: 24.w500.copyWith(color: colorScheme.onSurface),
              ),
            ),
            14.vertSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HomeSearchTextField(
                onChanged: (value) {
                  context.read<HomeBloc>().add(HomeSearchQueryChanged(value));
                },
              ),
            ),
            14.vertSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: HomeSearchTabSelector(
                selectedTab: state.selectedSearchTab,
                onSelectTab: (tabIndex) {
                  context.read<HomeBloc>().add(HomeSearchTabChanged(tabIndex));
                },
              ),
            ),
            Expanded(
              child: state.selectedSearchTab == 0
                  ? HomeSearchVendorsList(vendors: state.allVendors)
                  : HomeSearchEventsList(events: events),
            ),
          ],
        ),
      ),
    );
  }
}
