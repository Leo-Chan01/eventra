import 'dart:async';

import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_location_lookup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLocationLookupSheet {
  const HomeLocationLookupSheet._();

  static Future<void> show(
    BuildContext context, {
    bool closeOnSelect = true,
    bool showCloseAction = true,
    double heightFactor = 0.98,
    ValueChanged<String>? onLocationSelected,
  }) async {
    HomeBloc? ownedBloc;
    HomeBloc homeBloc;

    try {
      homeBloc = context.read<HomeBloc>();
    } catch (_) {
      ownedBloc = HomeBloc();
      homeBloc = ownedBloc;
    }

    try {
      await showCupertinoSheet<void>(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: homeBloc,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (sheetContext, state) {
                return FractionallySizedBox(
                  heightFactor: heightFactor,
                  child: HomeLocationLookupView(
                    state: state,
                    showCloseAction: showCloseAction,
                    closeOnSelect: closeOnSelect,
                    onLocationSelected: onLocationSelected,
                  ),
                );
              },
            ),
          );
        },
      );
    } finally {
      if (ownedBloc != null) {
        await ownedBloc.close();
      }
    }
  }
}
