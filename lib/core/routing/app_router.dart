import 'package:eventra/playground/widget_canvas.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: WidgetCanvas.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: WidgetCanvas.path,
        name: WidgetCanvas.name,
        builder: (context, state) => const WidgetCanvas(),
      ),
    ],
  );
}
