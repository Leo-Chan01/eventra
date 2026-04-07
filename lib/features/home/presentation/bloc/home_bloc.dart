import 'package:equatable/equatable.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class HomeDataRequested extends HomeEvent {
  const HomeDataRequested();
}

class HomeCategorySelected extends HomeEvent {
  const HomeCategorySelected(this.category);

  final String category;

  @override
  List<Object?> get props => [category];
}

class HomeFilterCategoryToggled extends HomeEvent {
  const HomeFilterCategoryToggled(this.category);

  final String category;

  @override
  List<Object?> get props => [category];
}

class HomeRatingChanged extends HomeEvent {
  const HomeRatingChanged(this.rating);

  final int rating;

  @override
  List<Object?> get props => [rating];
}

class HomePriceRangeChanged extends HomeEvent {
  const HomePriceRangeChanged({
    required this.minPrice,
    required this.maxPrice,
  });

  final double minPrice;
  final double maxPrice;

  @override
  List<Object?> get props => [minPrice, maxPrice];
}

class HomeLocationQueryChanged extends HomeEvent {
  const HomeLocationQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class HomeLocationSelected extends HomeEvent {
  const HomeLocationSelected(this.address);

  final String address;

  @override
  List<Object?> get props => [address];
}

class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.categories = const [],
    this.filterCategories = const [],
    this.vendors = const [],
    this.allVendors = const [],
    this.selectedCategory = 'All',
    this.selectedFilterCategories = const ['All'],
    this.selectedRating = 1,
    this.minPrice = 10000,
    this.maxPrice = 500000,
    this.selectedAddress = 'Lekki Phase 1, Lagos',
    this.locationQuery = '',
    this.recentLocations = const [],
    this.locationSuggestions = const [],
  });

  final int currentIndex;
  final List<Category> categories;
  final List<String> filterCategories;
  final List<Vendor> vendors;
  final List<Vendor> allVendors;
  final String selectedCategory;
  final List<String> selectedFilterCategories;
  final int selectedRating;
  final double minPrice;
  final double maxPrice;
  final String selectedAddress;
  final String locationQuery;
  final List<String> recentLocations;
  final List<String> locationSuggestions;

  HomeState copyWith({
    int? currentIndex,
    List<Category>? categories,
    List<String>? filterCategories,
    List<Vendor>? vendors,
    List<Vendor>? allVendors,
    String? selectedCategory,
    List<String>? selectedFilterCategories,
    int? selectedRating,
    double? minPrice,
    double? maxPrice,
    String? selectedAddress,
    String? locationQuery,
    List<String>? recentLocations,
    List<String>? locationSuggestions,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      categories: categories ?? this.categories,
      filterCategories: filterCategories ?? this.filterCategories,
      vendors: vendors ?? this.vendors,
      allVendors: allVendors ?? this.allVendors,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedFilterCategories:
          selectedFilterCategories ?? this.selectedFilterCategories,
      selectedRating: selectedRating ?? this.selectedRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      locationQuery: locationQuery ?? this.locationQuery,
      recentLocations: recentLocations ?? this.recentLocations,
      locationSuggestions: locationSuggestions ?? this.locationSuggestions,
    );
  }

  @override
  List<Object?> get props => [
    currentIndex,
    categories,
    filterCategories,
    vendors,
    allVendors,
    selectedCategory,
    selectedFilterCategories,
    selectedRating,
    minPrice,
    maxPrice,
    selectedAddress,
    locationQuery,
    recentLocations,
    locationSuggestions,
  ];
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_buildInitialState()) {
    on<HomeTabChanged>(_onTabChanged);
    on<HomeDataRequested>(_onDataRequested);
    on<HomeCategorySelected>(_onCategorySelected);
    on<HomeFilterCategoryToggled>(_onFilterCategoryToggled);
    on<HomeRatingChanged>(_onRatingChanged);
    on<HomePriceRangeChanged>(_onPriceRangeChanged);
    on<HomeLocationQueryChanged>(_onLocationQueryChanged);
    on<HomeLocationSelected>(_onLocationSelected);
  }

  void _onTabChanged(HomeTabChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onDataRequested(HomeDataRequested event, Emitter<HomeState> emit) {
    emit(_buildInitialState().copyWith(currentIndex: state.currentIndex));
  }

  void _onCategorySelected(
    HomeCategorySelected event,
    Emitter<HomeState> emit,
  ) {
    final nextState = state.copyWith(selectedCategory: event.category);
    emit(nextState.copyWith(vendors: _filterVendors(nextState)));
  }

  void _onFilterCategoryToggled(
    HomeFilterCategoryToggled event,
    Emitter<HomeState> emit,
  ) {
    final current = List<String>.from(state.selectedFilterCategories);

    if (event.category == 'All') {
      current
        ..clear()
        ..add('All');
    } else if (current.contains(event.category)) {
      current.remove(event.category);
    } else {
      current
        ..remove('All')
        ..add(event.category);
    }

    if (current.isEmpty) {
      current.add('All');
    }

    final nextState = state.copyWith(selectedFilterCategories: current);
    emit(nextState.copyWith(vendors: _filterVendors(nextState)));
  }

  void _onRatingChanged(HomeRatingChanged event, Emitter<HomeState> emit) {
    final nextState = state.copyWith(selectedRating: event.rating);
    emit(nextState.copyWith(vendors: _filterVendors(nextState)));
  }

  void _onPriceRangeChanged(
    HomePriceRangeChanged event,
    Emitter<HomeState> emit,
  ) {
    final nextState = state.copyWith(
      minPrice: event.minPrice,
      maxPrice: event.maxPrice,
    );
    emit(nextState.copyWith(vendors: _filterVendors(nextState)));
  }

  void _onLocationQueryChanged(
    HomeLocationQueryChanged event,
    Emitter<HomeState> emit,
  ) {
    final query = event.query.trim().toLowerCase();
    final suggestions = query.isEmpty
        ? state.recentLocations
        : state.recentLocations
              .where((location) => location.toLowerCase().contains(query))
              .toList();

    emit(
      state.copyWith(
        locationQuery: event.query,
        locationSuggestions: suggestions,
      ),
    );
  }

  void _onLocationSelected(
    HomeLocationSelected event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        selectedAddress: event.address,
        locationQuery: event.address,
        locationSuggestions: state.recentLocations,
      ),
    );
  }

  static HomeState _buildInitialState() {
    const categories = [
      Category(name: 'All'),
      Category(name: 'Decor'),
      Category(name: 'Cakes'),
      Category(name: 'MCs'),
      Category(name: 'DJs'),
      Category(name: 'Catering'),
    ];

    const filterCategories = [
      'All',
      'Decor',
      'DJ',
      'MC',
      'Cakes',
      'Catering',
      'Photography',
      'Rentals',
    ];

    const recentLocations = [
      'Lekki Phase 1, Lagos',
      'Admiralty Way, Lekki, Lagos',
      'Ikeja GRA, Lagos',
      'Victoria Island, Lagos',
      'Yaba, Lagos',
    ];

    const allVendors = [
      Vendor(
        name: 'Foodies Event',
        category: 'Catering',
        rating: 4.9,
        reviewsCount: 120,
        image: EventraImages.onboardingImage1,
        location: 'Lekki, Lagos',
        startingPrice: 180000,
        isFavorite: true,
      ),
      Vendor(
        name: 'Swift Pixel',
        category: 'Photography',
        rating: 4.8,
        reviewsCount: 86,
        image: EventraImages.onboardingImage2,
        location: 'Victoria Island, Lagos',
        startingPrice: 220000,
      ),
      Vendor(
        name: 'Wedding Grove',
        category: 'Decor',
        rating: 4.7,
        reviewsCount: 114,
        image: EventraImages.onboardingImage1,
        location: 'Ikoyi, Lagos',
        startingPrice: 150000,
      ),
      Vendor(
        name: 'Zin Events',
        category: 'MC',
        rating: 4.8,
        reviewsCount: 42,
        image: EventraImages.onboardingImage2,
        location: 'Surulere, Lagos',
        startingPrice: 90000,
      ),
    ];

    const initialState = HomeState(
      categories: categories,
      filterCategories: filterCategories,
      allVendors: allVendors,
      vendors: allVendors,
      recentLocations: recentLocations,
      locationSuggestions: recentLocations,
    );

    return initialState.copyWith(vendors: _filterVendors(initialState));
  }

  static List<Vendor> _filterVendors(HomeState state) {
    final activeFilters = state.selectedFilterCategories
        .where((category) => category != 'All')
        .toList();

    final filtered = state.allVendors.where((vendor) {
      final vendorCategory = vendor.category.toLowerCase();
      final matchesSelectedCategory =
          state.selectedCategory == 'All' ||
          vendorCategory.contains(state.selectedCategory.toLowerCase());
      final matchesFilter =
          activeFilters.isEmpty ||
          activeFilters.any(
            (category) => vendorCategory.contains(category.toLowerCase()),
          );
      final matchesRating = vendor.rating >= state.selectedRating;
      final matchesPrice =
          vendor.startingPrice >= state.minPrice &&
          vendor.startingPrice <= state.maxPrice;

      return matchesSelectedCategory &&
          matchesFilter &&
          matchesRating &&
          matchesPrice;
    }).toList();

    return filtered.isEmpty ? state.allVendors : filtered;
  }
}
