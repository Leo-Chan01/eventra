import 'package:eventra/features/auth/forgot_password/presentation/pages/forgot_password_otp_page.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/password_reset_success_page.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:eventra/features/auth/login/presentation/pages/login_page.dart';
import 'package:eventra/features/auth/setup_pin/presentation/pages/setup_pin_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/otp_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/personal_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/completed_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/review_submitted_page.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/chat_page.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/client_inbox_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/client_notifications_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_details_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_history_page.dart';
import 'package:eventra/features/client/featured_and_top_vendors/presentation/pages/category_vendors_page.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_reset_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_help_support_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_notification_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_personal_information_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_policy_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_security_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_rate_us_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_saved_vendors_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_terms_and_conditions_page.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/pages/onboarding_loading_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/pages/onboarding_slides_page.dart';
import 'package:eventra/playground/widget_canvas.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // initialLocation: OnboardingLoadingPage.path,
    initialLocation: HomePage.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: LoginPage.path,
        name: LoginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: WidgetCanvas.path,
        name: WidgetCanvas.name,
        builder: (context, state) => const WidgetCanvas(),
      ),
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: ClientNotificationsPage.path,
        name: ClientNotificationsPage.name,
        builder: (context, state) => const ClientNotificationsPage(),
      ),
      GoRoute(
        path: ProfilePersonalInformationPage.path,
        name: ProfilePersonalInformationPage.name,
        builder: (context, state) => const ProfilePersonalInformationPage(),
      ),
      GoRoute(
        path: ProfileNotificationSettingsPage.path,
        name: ProfileNotificationSettingsPage.name,
        builder: (context, state) => const ProfileNotificationSettingsPage(),
      ),
      GoRoute(
        path: ProfilePrivacySecurityPage.path,
        name: ProfilePrivacySecurityPage.name,
        builder: (context, state) => const ProfilePrivacySecurityPage(),
      ),
      GoRoute(
        path: ProfileSavedVendorsPage.path,
        name: ProfileSavedVendorsPage.name,
        builder: (context, state) => const ProfileSavedVendorsPage(),
      ),
      GoRoute(
        path: ProfileHelpSupportPage.path,
        name: ProfileHelpSupportPage.name,
        builder: (context, state) => const ProfileHelpSupportPage(),
      ),
      GoRoute(
        path: ProfileAppSettingsPage.path,
        name: ProfileAppSettingsPage.name,
        builder: (context, state) => const ProfileAppSettingsPage(),
      ),
      GoRoute(
        path: ProfileAppResetPage.path,
        name: ProfileAppResetPage.name,
        builder: (context, state) => const ProfileAppResetPage(),
      ),
      GoRoute(
        path: ProfilePrivacyPolicyPage.path,
        name: ProfilePrivacyPolicyPage.name,
        builder: (context, state) => const ProfilePrivacyPolicyPage(),
      ),
      GoRoute(
        path: ProfileRateUsPage.path,
        name: ProfileRateUsPage.name,
        builder: (context, state) => const ProfileRateUsPage(),
      ),
      GoRoute(
        path: ProfileTermsAndConditionsPage.path,
        name: ProfileTermsAndConditionsPage.name,
        builder: (context, state) => const ProfileTermsAndConditionsPage(),
      ),
      GoRoute(
        path: TransactionHistoryPage.path,
        name: TransactionHistoryPage.name,
        builder: (context, state) => const TransactionHistoryPage(),
      ),
      GoRoute(
        path: TransactionDetailsPage.path,
        name: TransactionDetailsPage.name,
        builder: (context, state) => const TransactionDetailsPage(),
      ),
      GoRoute(
        path: OnboardingLoadingPage.path,
        name: OnboardingLoadingPage.name,
        builder: (context, state) => const OnboardingLoadingPage(),
      ),
      GoRoute(
        path: OnboardingSlidesPage.path,
        name: OnboardingSlidesPage.name,
        builder: (context, state) => const OnboardingSlidesPage(),
      ),
      GoRoute(
        path: SignupPage.path,
        name: SignupPage.name,
        builder: (context, state) {
          final accountType = state.extra as AccountType? ?? AccountType.client;
          return SignupPage(accountType: accountType);
        },
      ),
      GoRoute(
        path: OTPVerificationPage.path,
        name: OTPVerificationPage.name,
        builder: (context, state) => const OTPVerificationPage(),
      ),
      GoRoute(
        path: PersonalDetailsPage.path,
        name: PersonalDetailsPage.name,
        builder: (context, state) => const PersonalDetailsPage(),
      ),
      GoRoute(
        path: WelcomeSuccessPage.path,
        name: WelcomeSuccessPage.name,
        builder: (context, state) => const WelcomeSuccessPage(),
      ),
      GoRoute(
        path: TermsAndConditionsPage.path,
        name: TermsAndConditionsPage.name,
        builder: (context, state) => const TermsAndConditionsPage(),
      ),
      GoRoute(
        path: ForgotPasswordPage.path,
        name: ForgotPasswordPage.name,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: ForgotPasswordOtpPage.path,
        name: ForgotPasswordOtpPage.name,
        builder: (context, state) => const ForgotPasswordOtpPage(),
      ),
      GoRoute(
        path: ResetPasswordPage.path,
        name: ResetPasswordPage.name,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: PasswordResetSuccessPage.path,
        name: PasswordResetSuccessPage.name,
        builder: (context, state) => const PasswordResetSuccessPage(),
      ),
      GoRoute(
        path: SetupPinPage.path,
        name: SetupPinPage.name,
        builder: (context, state) => const SetupPinPage(),
      ),
      GoRoute(
        path: VendorDetailPage.path,
        name: VendorDetailPage.name,
        builder: (context, state) => const VendorDetailPage(),
      ),
      GoRoute(
        path: CatalogItemDetailPage.path,
        name: CatalogItemDetailPage.name,
        builder: (context, state) => const CatalogItemDetailPage(),
      ),
      GoRoute(
        path: EnquiryFormPage.path,
        name: EnquiryFormPage.name,
        builder: (context, state) => const EnquiryFormPage(),
      ),
      GoRoute(
        path: EnquiryReviewPage.path,
        name: EnquiryReviewPage.name,
        builder: (context, state) => const EnquiryReviewPage(),
      ),
      GoRoute(
        path: EnquirySentPage.path,
        name: EnquirySentPage.name,
        builder: (context, state) => const EnquirySentPage(),
      ),
      GoRoute(
        path: CompletedEnquiryDetailPage.path,
        name: CompletedEnquiryDetailPage.name,
        builder: (context, state) => const CompletedEnquiryDetailPage(),
      ),
      GoRoute(
        path: ReviewSubmittedPage.path,
        name: ReviewSubmittedPage.name,
        builder: (context, state) => const ReviewSubmittedPage(),
      ),
      GoRoute(
        path: ClientInboxPage.path,
        name: ClientInboxPage.name,
        builder: (context, state) => const ClientInboxPage(),
      ),
      GoRoute(
        path: ChatPage.path,
        name: ChatPage.name,
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: CategoryVendorsPage.path,
        name: CategoryVendorsPage.name,
        builder: (context, state) => CategoryVendorsPage(
          categoryName: state.extra! as String,
        ),
      ),
    ],
  );
}
