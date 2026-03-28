import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_slides_event.dart';
part 'onboarding_slides_state.dart';

class OnboardingSlidesBloc
    extends Bloc<OnboardingSlidesEvent, OnboardingSlidesState> {
  OnboardingSlidesBloc() : super(OnboardingSlidesState.initial()) {
    on<OnboardingSlideChanged>(_onSlideChanged);
  }

  void _onSlideChanged(
    OnboardingSlideChanged event,
    Emitter<OnboardingSlidesState> emit,
  ) {
    emit(
      state.copyWith(
        currentIndex: event.index,
        isLastSlide: event.index == 2,
      ),
    );
  }
}
