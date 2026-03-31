import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Events for [ConnectivityBloc].
abstract class ConnectivityEvent {
  const ConnectivityEvent();
}

class ConnectivityStatusChanged extends ConnectivityEvent {
  const ConnectivityStatusChanged(this.results);
  final List<ConnectivityResult> results;
}

/// States for [ConnectivityBloc].
enum ConnectivityStatus { initial, connected, disconnected }

class ConnectivityState {
  const ConnectivityState({
    this.status = ConnectivityStatus.initial,
    this.results = const [],
  });
  final ConnectivityStatus status;
  final List<ConnectivityResult> results;

  bool get isConnected => status == ConnectivityStatus.connected;

  ConnectivityState copyWith({
    ConnectivityStatus? status,
    List<ConnectivityResult>? results,
  }) {
    return ConnectivityState(
      status: status ?? this.status,
      results: results ?? this.results,
    );
  }
}

/// [ConnectivityBloc] to monitor internet connectivity.
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(const ConnectivityState()) {
    on<ConnectivityStatusChanged>((event, emit) {
      final isConnected = event.results.any(
        (result) => result != ConnectivityResult.none,
      );
      emit(
        state.copyWith(
          status: isConnected
              ? ConnectivityStatus.connected
              : ConnectivityStatus.disconnected,
          results: event.results,
        ),
      );
    });

    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      add(ConnectivityStatusChanged(results));
    });
  }
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  Future<void> close() {
    unawaited(_subscription?.cancel());
    return super.close();
  }
}
