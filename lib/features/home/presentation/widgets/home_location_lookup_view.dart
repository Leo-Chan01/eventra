import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLocationLookupView extends StatefulWidget {
  const HomeLocationLookupView({
    required this.state,
    this.showCloseAction = false,
    this.closeOnSelect = false,
    super.key,
  });

  final HomeState state;
  final bool showCloseAction;
  final bool closeOnSelect;

  @override
  State<HomeLocationLookupView> createState() => _HomeLocationLookupViewState();
}

class _HomeLocationLookupViewState extends State<HomeLocationLookupView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.state.locationQuery);
  }

  @override
  void didUpdateWidget(covariant HomeLocationLookupView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.text != widget.state.locationQuery) {
      _controller.value = TextEditingValue(
        text: widget.state.locationQuery,
        selection: TextSelection.collapsed(
          offset: widget.state.locationQuery.length,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final state = widget.state;
    final suggestions = state.locationQuery.isEmpty
        ? state.recentLocations
        : state.locationSuggestions;

    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            widget.showCloseAction ? 12 : 16,
            0,
            24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showCloseAction) ...[
                Center(
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.48),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                12.vertSpacing,
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      widget.showCloseAction
                          ? l10n.homeYourCurrentAddress
                          : l10n.homeLocationLookupTitle,
                      style: 20.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    const Spacer(),
                    if (widget.showCloseAction)
                      InkWell(
                        key: const Key('home_location_close_button'),
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.circular(999),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                            EventraVectors.cancelIconNoCircle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              12.vertSpacing,
              Divider(
                color: colorScheme.outlineVariant.withValues(alpha: 0.20),
                height: 1,
              ),
              16.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 0.5,
                      color: state.locationQuery.isNotEmpty
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.24,
                            ),
                    ),
                  ),
                  child: TextField(
                    key: const Key('home_location_search_input'),
                    controller: _controller,
                    autofocus: widget.showCloseAction,
                    onChanged: (value) {
                      context.read<HomeBloc>().add(
                        HomeLocationQueryChanged(value),
                      );
                    },
                      
                    decoration: InputDecoration(
                      fillColor: colorScheme.surface,
                      border: InputBorder.none,
                      hintText: widget.showCloseAction
                          ? l10n.homeEnterAddress
                          : l10n.homeSearchByLocation,
                      hintStyle: 14.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          EventraVectors.searchNormal,
                        ),
                      ),
                      suffixIcon: state.locationQuery.isEmpty
                          ? null
                          : InkWell(
                              key: const Key('home_location_clear_button'),
                              onTap: () {
                                _controller.clear();
                                context.read<HomeBloc>().add(
                                  const HomeLocationQueryChanged(''),
                                );
                              },
                              borderRadius: BorderRadius.circular(999),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  EventraVectors.cancelSearchIcon,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              16.vertSpacing,
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: suggestions.length,
                  separatorBuilder: (_, _) => 14.vertSpacing,
                  itemBuilder: (context, index) {
                    final location = suggestions[index];

                    return InkWell(
                      key: ValueKey('home_location_suggestion_$index'),
                      onTap: () {
                        context.read<HomeBloc>().add(
                          HomeLocationSelected(location),
                        );
                        if (widget.closeOnSelect) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        location,
                        style: 15.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.35,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
