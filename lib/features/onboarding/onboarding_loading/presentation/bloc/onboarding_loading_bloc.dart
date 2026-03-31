import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class OnboardingLoadingEvent extends Equatable {
  const OnboardingLoadingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingLoadingStarted extends OnboardingLoadingEvent {}

class OnboardingLoadingAnimationCompleted extends OnboardingLoadingEvent {}

// States
abstract class OnboardingLoadingState extends Equatable {
  const OnboardingLoadingState();

  @override
  List<Object> get props => [];
}

class OnboardingLoadingInitial extends OnboardingLoadingState {}

class OnboardingLoadingInProgress extends OnboardingLoadingState {}

class OnboardingLoadingWaitingForAnimation extends OnboardingLoadingState {}

class OnboardingLoadingSuccess extends OnboardingLoadingState {}

class OnboardingLoadingFailure extends OnboardingLoadingState {
  const OnboardingLoadingFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

// Bloc
class OnboardingLoadingBloc
    extends Bloc<OnboardingLoadingEvent, OnboardingLoadingState> {
  OnboardingLoadingBloc() : super(OnboardingLoadingInitial()) {
    on<OnboardingLoadingStarted>(_onStarted);
    on<OnboardingLoadingAnimationCompleted>(_onAnimationCompleted);
  }

  bool _initializationDone = false;
  bool _animationDone = false;

  Future<void> _onStarted(
    OnboardingLoadingStarted event,
    Emitter<OnboardingLoadingState> emit,
  ) async {
    emit(OnboardingLoadingInProgress());

    // TODO(eventra): Add actual initialization logic here
    // For now, we'll simulate a small delay to mimic async work
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    _initializationDone = true;
    _checkCompletion(emit);
  }

  void _onAnimationCompleted(
    OnboardingLoadingAnimationCompleted event,
    Emitter<OnboardingLoadingState> emit,
  ) {
    _animationDone = true;
    _checkCompletion(emit);
  }

  void _checkCompletion(Emitter<OnboardingLoadingState> emit) {
    if (_initializationDone && _animationDone) {
      emit(OnboardingLoadingSuccess());
    } else if (_initializationDone) {
      emit(OnboardingLoadingWaitingForAnimation());
    }
  }
}
