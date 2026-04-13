import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_event_detail_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_event_detail_page.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_event_seed.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_events_list.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_tab_selector.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_text_field.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_vendors_list.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({required this.state, super.key});

  final HomeState state;

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _requestFocusIfActive();
  }

  @override
  void didUpdateWidget(covariant HomeSearchPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.currentIndex != widget.state.currentIndex) {
      _requestFocusIfActive();
    }
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _requestFocusIfActive() {
    if (widget.state.currentIndex != 2) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _searchFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final events = HomeSearchEventSeed.fromL10n(l10n);

    return Material(
      color: AppColorSchemes.transparent,
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
                focusNode: _searchFocusNode,
                onChanged: (value) {
                  context.read<HomeBloc>().add(HomeSearchQueryChanged(value));
                },
              ),
            ),
            14.vertSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: HomeSearchTabSelector(
                selectedTab: widget.state.selectedSearchTab,
                onSelectTab: (tabIndex) {
                  context.read<HomeBloc>().add(HomeSearchTabChanged(tabIndex));
                },
              ),
            ),
            Expanded(
              child: widget.state.selectedSearchTab == 0
                  ? HomeSearchVendorsList(vendors: widget.state.allVendors)
                  : HomeSearchEventsList(
                      events: events,
                      onEventTap: (event) async {
                        await context.pushNamed(
                          TicketEventDetailPage.name,
                          extra: TicketEventDetailArgs(event: event),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
