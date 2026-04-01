import 'package:equatable/equatable.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeTabChanged extends HomeEvent {
  const HomeTabChanged(this.index);
  final int index;
  @override
  List<Object?> get props => [index];
}

class HomeDataRequested extends HomeEvent {}

// State
class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.vendors = const [],
    this.categories = const [],
  });

  final int currentIndex;
  final List<Vendor> vendors;
  final List<Category> categories;

  HomeState copyWith({
    int? currentIndex,
    List<Vendor>? vendors,
    List<Category>? categories,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      vendors: vendors ?? this.vendors,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [currentIndex, vendors, categories];
}

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeTabChanged>(_onTabChanged);
    on<HomeDataRequested>(_onDataRequested);

    add(HomeDataRequested());
  }

  void _onTabChanged(HomeTabChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onDataRequested(HomeDataRequested event, Emitter<HomeState> emit) {
    // Mock data for now
    const categories = [
      Category(name: 'All', icon: '🌟'),
      Category(name: 'Catering', icon: '🍳'),
      Category(name: 'Photography', icon: '📸'),
      Category(name: 'Decorator', icon: '🎨'),
      Category(name: 'Hall', icon: '🏢'),
    ];

    final vendors = [
      Vendor(
        name: 'Gems Catering Service',
        category: 'Catering',
        rating: 4.5,
        reviewsCount: 120,
        image: EventraImages.onboardingImage1, // Fallback
        isFavorite: true,
      ),
      Vendor(
        name: 'Lens Culture',
        category: 'Photography',
        rating: 4.8,
        reviewsCount: 85,
        image: EventraImages.onboardingImage2, // Fallback
      ),
      Vendor(
        name: 'Royal Events Hall',
        category: 'Venue',
        rating: 4.7,
        reviewsCount: 200,
        image: EventraImages.onboardingImage1, // Fallback
      ),
    ];

    emit(state.copyWith(
      categories: categories,
      vendors: vendors,
    ));
  }
}
