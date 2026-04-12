import 'package:eventra/features/client/featured_and_top_vendors/presentation/pages/category_vendors_page.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders category vendors layout and filters vendors by search', (
    tester,
  ) async {
    await tester.pumpApp(
      BlocProvider(
        create: (_) => HomeBloc(),
        child: const CategoryVendorsPage(categoryName: 'Decorator'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Decorator'), findsOneWidget);
    expect(find.textContaining('Featured Vendors'), findsOneWidget);
    expect(find.text('360 Events'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'swift');
    await tester.pumpAndSettle();

    expect(find.text('Swift Pixel'), findsOneWidget);
    expect(find.text('360 Events'), findsNothing);
  });
}
