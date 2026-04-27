import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets(
    'vendor detail opens on catalog tab and hides enquiry bar in vendor mode',
    (tester) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => VendorDetailBloc()),
            BlocProvider(create: (_) => ClientBookingBloc()),
          ],
          child: const VendorDetailPage(
            args: VendorDetailPageArgs(
              vendorId: 'vendor-001',
              isVendorMode: true,
              initialTabIndex: 1,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Catalog'), findsWidgets);
      expect(find.text('Pre-wedding Photoshoot'), findsOneWidget);
      expect(find.byType(VendorDetailBottomBar), findsNothing);
      expect(find.text('Make Enquiry'), findsNothing);
    },
  );
}
