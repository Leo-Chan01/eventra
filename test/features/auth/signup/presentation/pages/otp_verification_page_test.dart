import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/otp_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_app_bar.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_progress_header.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/pump_app.dart';

class _MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

void main() {
  late _MockSignupBloc signupBloc;

  setUp(() {
    signupBloc = _MockSignupBloc();
    when(() => signupBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpOtpPage(WidgetTester tester, SignupState state) async {
    when(() => signupBloc.state).thenReturn(state);

    await tester.pumpApp(
      BlocProvider<SignupBloc>.value(
        value: signupBloc,
        child: const OTPVerificationPage(),
      ),
    );
  }

  group('OTPVerificationPage', () {
    testWidgets('shows vendor signup progress header for vendor account type', (
      tester,
    ) async {
      await pumpOtpPage(
        tester,
        const SignupState(accountType: AccountType.vendor),
      );

      expect(find.byType(SignupFlowAppBar), findsOneWidget);
      expect(find.byType(SignupFlowProgressHeader), findsOneWidget);
      expect(find.text('1/4'), findsOneWidget);
    });

    testWidgets('hides vendor signup progress header for client account type', (
      tester,
    ) async {
      await pumpOtpPage(
        tester,
        const SignupState(accountType: AccountType.client),
      );

      expect(find.byType(SignupFlowAppBar), findsOneWidget);
      expect(find.byType(SignupFlowProgressHeader), findsNothing);
      expect(find.text('1/4'), findsNothing);
    });
  });
}
