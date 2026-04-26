import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_inbox_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders vendor inbox chat list UI', (tester) async {
    await tester.pumpApp(
      BlocProvider(
        create: (_) => ClientInboxBloc(),
        child: const Scaffold(body: VendorInboxTab()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Jenny'), findsOneWidget);
    expect(find.text('Moses'), findsOneWidget);
    expect(find.text('Tayo'), findsOneWidget);
    expect(find.text('2'), findsNWidgets(2));
  });
}
