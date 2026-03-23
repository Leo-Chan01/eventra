import 'package:eventra/core/internet/connectivity_bloc.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

/// A widget that overlays a connectivity status message when offline.
class ConnectivityOverlay extends StatelessWidget {
  const ConnectivityOverlay({
    required this.connectivityStatus,
    required this.child,
    super.key,
  });

  final ConnectivityStatus connectivityStatus;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (connectivityStatus == ConnectivityStatus.disconnected)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.error,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SafeArea(
                  bottom: false,
                  child: Center(
                    child: Text(
                      'No Internet Connection',
                      style: 14.bold.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
