import 'dart:async';

import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
import 'package:eventra/features/home/presentation/widgets/home_content.dart';
import 'package:eventra/features/home/presentation/widgets/home_enquiries_tab.dart';
import 'package:eventra/features/home/presentation/widgets/home_filter_options_sheet.dart';
import 'package:eventra/features/home/presentation/widgets/home_location_lookup_view.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_tab.dart';
import 'package:eventra/features/home/presentation/widgets/home_reels_tab.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_page.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    this.isGuestMode = false,
    super.key,
  });

  static const String path = '/home';
  static const String name = 'home';

  final bool isGuestMode;

  @override
  Widget build(BuildContext context) {
    final homeKey = ValueKey('home_guest_mode_$isGuestMode');
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: homeKey,
          backgroundColor: colorScheme.surface,
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              SafeArea(
                bottom: false,
                child: HomeContent(
                  state: state,
                  onOpenFilter: () => _openFilterSheet(context),
                  onOpenSearch: () => _openSearchTab(context),
                ),
              ),
              SafeArea(
                bottom: false,
                child: HomeEnquiriesTab(
                  state: state,
                  onOpenFilter: () => _openFilterSheet(context),
                  onOpenSearch: () => _openSearchTab(context),
                ),
              ),
              HomeSearchPage(state: state),
              HomeReelsTab(
                reels: state.reels,
                onShareReel: (reel) async {
                  await AppShareBottomSheet.show(
                    context,
                    shareText: '${reel.title} on Eventra',
                  );
                },
              ),
              SafeArea(
                bottom: false,
                child: HomeProfileTab(
                  profile: state.profile,
                  onBack: () {
                    context.read<HomeBloc>().add(const HomeTabChanged(0));
                  },
                ),
              ),
            ],
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
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (sheetContext) {
          return BlocProvider.value(
            value: homeBloc,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                return FractionallySizedBox(
                  heightFactor: 0.69,
                  child: HomeFilterOptionsSheet(
                    state: state,
                    onOpenLocationLookup: () {
                      Navigator.of(sheetContext).pop();
                      _openLocationLookupSheet(context);
                    },
                  ),
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
      showCupertinoSheet(
        context: context,
        // isScrollControlled: true,
        // useSafeArea: true,
        // clipBehavior: Clip.antiAlias,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        // ),
        // backgroundColor: Theme.of(context).colorScheme.surface,
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openSearchTab(BuildContext context) {
    context.read<HomeBloc>().add(const HomeTabChanged(2));
  }
}
