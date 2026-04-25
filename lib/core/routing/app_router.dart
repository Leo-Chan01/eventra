import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
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
import 'package:eventra/features/auth/signup/presentation/pages/vendor_business_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_category_selection_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_bank_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_business_address_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_cac_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_congratulations_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_facial_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_preview_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_scan_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_nin_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_selfie_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_transaction_pin_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_under_review_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/active_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/awaiting_payment_enquiry_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/completed_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_contract_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_review_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/payment_received_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/pending_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/review_submitted_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_card_payment_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_checkout_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_event_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_payment_success_page.dart';
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
import 'package:eventra/features/home/presentation/pages/vendor_ongoing_job_detail_page.dart';
import 'package:eventra/features/home/presentation/pages/vendor_transfer_success_page.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/pages/onboarding_loading_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/pages/onboarding_slides_page.dart';
import 'package:eventra/playground/widget_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: OnboardingLoadingPage.path,
    // initialLocation: HomePage.path,
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
        builder: (context, state) {
          final isGuestMode = state.uri.queryParameters['guest'] == 'true';
          final isVendorByQuery = state.uri.queryParameters['vendor'] == 'true';
          AccountTypeTrackerState? trackerState;
          try {
            trackerState = context.read<AccountTypeTrackerBloc>().state;
          } catch (_) {
            trackerState = null;
          }
          final isVendorByTracker =
              trackerState?.isGuestMode == false &&
              trackerState?.selectedAccountType == AccountType.vendor;

          return HomePage(
            isGuestMode: isGuestMode,
            isVendorMode: isVendorByQuery || isVendorByTracker,
          );
        },
      ),
      GoRoute(
        path: VendorTransferSuccessPage.path,
        name: VendorTransferSuccessPage.name,
        builder: (context, state) {
          final amount = state.extra as String? ?? '';
          return VendorTransferSuccessPage(amount: amount);
        },
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
        path: VendorCategorySelectionPage.path,
        name: VendorCategorySelectionPage.name,
        builder: (context, state) => const VendorCategorySelectionPage(),
      ),
      GoRoute(
        path: VendorBusinessDetailsPage.path,
        name: VendorBusinessDetailsPage.name,
        builder: (context, state) => const VendorBusinessDetailsPage(),
      ),
      GoRoute(
        path: WelcomeSuccessPage.path,
        name: WelcomeSuccessPage.name,
        builder: (context, state) => const WelcomeSuccessPage(),
      ),
      GoRoute(
        path: VendorKycPage.path,
        name: VendorKycPage.name,
        builder: (context, state) => const VendorKycPage(),
      ),
      GoRoute(
        path: VendorKycNinPage.path,
        name: VendorKycNinPage.name,
        builder: (context, state) => const VendorKycNinPage(),
      ),
      GoRoute(
        path: VendorKycFacialVerificationPage.path,
        name: VendorKycFacialVerificationPage.name,
        builder: (context, state) => const VendorKycFacialVerificationPage(),
      ),
      GoRoute(
        path: VendorKycSelfiePage.path,
        name: VendorKycSelfiePage.name,
        builder: (context, state) => const VendorKycSelfiePage(),
      ),
      GoRoute(
        path: VendorKycCacPage.path,
        name: VendorKycCacPage.name,
        builder: (context, state) => const VendorKycCacPage(),
      ),
      GoRoute(
        path: VendorKycBusinessAddressPage.path,
        name: VendorKycBusinessAddressPage.name,
        builder: (context, state) => const VendorKycBusinessAddressPage(),
      ),
      GoRoute(
        path: VendorKycBankDetailsPage.path,
        name: VendorKycBankDetailsPage.name,
        builder: (context, state) => const VendorKycBankDetailsPage(),
      ),
      GoRoute(
        path: VendorKycTransactionPinPage.path,
        name: VendorKycTransactionPinPage.name,
        builder: (context, state) => const VendorKycTransactionPinPage(),
      ),
      GoRoute(
        path: VendorKycUnderReviewPage.path,
        name: VendorKycUnderReviewPage.name,
        builder: (context, state) => const VendorKycUnderReviewPage(),
      ),
      GoRoute(
        path: VendorKycCongratulationsPage.path,
        name: VendorKycCongratulationsPage.name,
        builder: (context, state) => const VendorKycCongratulationsPage(),
      ),
      GoRoute(
        path: VendorKycGovIdPage.path,
        name: VendorKycGovIdPage.name,
        builder: (context, state) => const VendorKycGovIdPage(),
      ),
      GoRoute(
        path: VendorKycGovIdScanPage.path,
        name: VendorKycGovIdScanPage.name,
        builder: (context, state) => const VendorKycGovIdScanPage(),
      ),
      GoRoute(
        path: VendorKycGovIdPreviewPage.path,
        name: VendorKycGovIdPreviewPage.name,
        builder: (context, state) => const VendorKycGovIdPreviewPage(),
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
        path: PendingEnquiryDetailPage.path,
        name: PendingEnquiryDetailPage.name,
        builder: (context, state) => const PendingEnquiryDetailPage(),
      ),
      GoRoute(
        path: AwaitingPaymentEnquiryPage.path,
        name: AwaitingPaymentEnquiryPage.name,
        builder: (context, state) => const AwaitingPaymentEnquiryPage(),
      ),
      GoRoute(
        path: EnquiryInvoicePage.path,
        name: EnquiryInvoicePage.name,
        builder: (context, state) => const EnquiryInvoicePage(),
      ),
      GoRoute(
        path: EnquiryContractPage.path,
        name: EnquiryContractPage.name,
        builder: (context, state) => const EnquiryContractPage(),
      ),
      GoRoute(
        path: PaymentReceivedPage.path,
        name: PaymentReceivedPage.name,
        builder: (context, state) => const PaymentReceivedPage(),
      ),
      GoRoute(
        path: ActiveEnquiryDetailPage.path,
        name: ActiveEnquiryDetailPage.name,
        builder: (context, state) => const ActiveEnquiryDetailPage(),
      ),
      GoRoute(
        path: VendorOngoingJobDetailPage.path,
        name: VendorOngoingJobDetailPage.name,
        builder: (context, state) => const VendorOngoingJobDetailPage(),
      ),
      GoRoute(
        path: ReviewSubmittedPage.path,
        name: ReviewSubmittedPage.name,
        builder: (context, state) => const ReviewSubmittedPage(),
      ),
      GoRoute(
        path: TicketCheckoutPage.path,
        name: TicketCheckoutPage.name,
        builder: (context, state) => const TicketCheckoutPage(),
      ),
      GoRoute(
        path: TicketEventDetailPage.path,
        name: TicketEventDetailPage.name,
        builder: (context, state) => const TicketEventDetailPage(),
      ),
      GoRoute(
        path: TicketCardPaymentPage.path,
        name: TicketCardPaymentPage.name,
        builder: (context, state) => const TicketCardPaymentPage(),
      ),
      GoRoute(
        path: TicketPaymentSuccessPage.path,
        name: TicketPaymentSuccessPage.name,
        builder: (context, state) => const TicketPaymentSuccessPage(),
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
