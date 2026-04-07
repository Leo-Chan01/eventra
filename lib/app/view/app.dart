import 'package:eventra/core/constants/app_constants.dart';
import 'package:eventra/core/internet/connectivity_bloc.dart';
import 'package:eventra/core/routing/app_router.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/app_theme.dart';
import 'package:eventra/shared/theme/theme_bloc.dart';
import 'package:eventra/shared/widgets/connectivity_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConnectivityBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => SignupBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => ForgotPasswordBloc()),
        BlocProvider(create: (_) => SetupPinBloc()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => ClientNotificationBloc()),
        BlocProvider(create: (_) => VendorDetailBloc()),
        BlocProvider(create: (_) => ClientBookingBloc()),
        BlocProvider(create: (_) => ClientInboxBloc()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                ensureScreenSize: true,
                rebuildFactor: (old, data) => true,
                builder: (context, child) {
                  return BlocBuilder<ThemeBloc, ThemeMode>(
                    builder: (context, themeMode) {
                      return MaterialApp.router(
                        title: AppConstants.appName,
                        debugShowCheckedModeBanner: false,
                        theme: AppTheme.lightTheme(),
                        darkTheme: AppTheme.darkTheme(),
                        themeMode: themeMode,
                        localizationsDelegates:
                            AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        routerConfig: AppRouter.router,
                        scaffoldMessengerKey:
                            GlobalSnackBar.scaffoldMessengerKey,
                        builder: (context, child) {
                          return BlocBuilder<
                            ConnectivityBloc,
                            ConnectivityState
                          >(
                            builder: (context, connectivityState) {
                              return ConnectivityOverlay(
                                connectivityStatus: connectivityState.status,
                                child: child!,
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
