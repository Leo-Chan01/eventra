import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
import 'package:eventra/features/home/presentation/widgets/home_categories.dart';
import 'package:eventra/features/home/presentation/widgets/home_content.dart';
import 'package:eventra/features/home/presentation/widgets/home_header.dart';
import 'package:eventra/features/home/presentation/widgets/home_join_as_vendor_cta.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_featured.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_top_rated.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_week.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.currentIndex,
              children: [
                HomeContent(state: state),
                const Center(child: Text('Enquiries Page')),
                const Center(child: Text('Search Page')),
                const Center(child: Text('Showcase Page')),
                const Center(child: Text('Profile Page')),
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
}
