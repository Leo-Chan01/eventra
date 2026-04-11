import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
import 'package:eventra/features/home/presentation/widgets/home_content.dart';
import 'package:eventra/features/home/presentation/widgets/home_explore_tab.dart';
import 'package:eventra/features/home/presentation/widgets/home_filter_options_sheet.dart';
import 'package:eventra/features/home/presentation/widgets/home_location_lookup_view.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = '/home';
  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.currentIndex,
              children: [
                HomeContent(
                  state: state,
                  onOpenFilter: () => _openFilterSheet(context),
                  onOpenLocationLookup: () => _openLocationLookupSheet(context),
                ),
                HomeExploreTab(
                  state: state,
                  onOpenFilter: () => _openFilterSheet(context),
                  onOpenLocationLookup: () => _openLocationLookupSheet(context),
                ),
                HomeLocationLookupView(state: state),
                Center(
                  child: Text(
                    l10n.navShowcase,
                    style: 18.w600.copyWith(color: colorScheme.onSurface),
                  ),
                ),
                Center(
                  child: Text(
                    l10n.navProfile,
                    style: 18.w600.copyWith(color: colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: EventraBottomNav(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(HomeTabChanged(index));
            },
          ),
        );
      },
    );
  }

  void _openFilterSheet(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (sheetContext) {
          return BlocProvider.value(
            value: homeBloc,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                return FractionallySizedBox(
                  heightFactor: 0.69,
                  child: HomeFilterOptionsSheet(state: state),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openLocationLookupSheet(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (_) {
          return BlocProvider.value(
            value: homeBloc,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return FractionallySizedBox(
                  heightFactor: 0.94,
                  child: HomeLocationLookupView(
                    state: state,
                    showCloseAction: true,
                    closeOnSelect: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
