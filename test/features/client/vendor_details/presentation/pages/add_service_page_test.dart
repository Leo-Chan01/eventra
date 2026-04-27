import 'package:eventra/features/client/vendor_details/presentation/models/add_service_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/add_service_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets('opens catalog tab by default', (tester) async {
    await tester.pumpApp(const AddServicePage());

    expect(find.text('Add a service'), findsOneWidget);
    expect(find.text('Create a catalog'), findsOneWidget);
    expect(find.text('Showcase a video'), findsOneWidget);
    expect(find.text('Service Name'), findsOneWidget);
    expect(find.text('Upload Images'), findsOneWidget);
  });

  testWidgets('opens showcase video tab when requested', (tester) async {
    await tester.pumpApp(
      const AddServicePage(
        args: AddServicePageArgs(initialTab: AddServiceTab.video),
      ),
    );

    expect(find.text('Tap to Upload a Video'), findsOneWidget);
    expect(find.text('Max duration is 60 seconds'), findsOneWidget);
    expect(find.text('Tag Services'), findsOneWidget);
  });
}
