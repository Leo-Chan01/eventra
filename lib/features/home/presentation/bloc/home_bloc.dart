//
// ignore_for_file: avoid_redundant_argument_values

import 'package:equatable/equatable.dart';
import 'package:eventra/features/home/domain/models/home_app_toggle_type.dart';
import 'package:eventra/features/home/domain/models/home_enquiry_status.dart';
import 'package:eventra/features/home/domain/models/home_notification_preference.dart';
import 'package:eventra/features/home/domain/models/home_profile.dart';
import 'package:eventra/features/home/domain/models/home_reel.dart';
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

class HomeEnquiryStatusChanged extends HomeEvent {
  const HomeEnquiryStatusChanged(this.status);

  final HomeEnquiryStatus status;

  @override
  List<Object?> get props => [status];
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

class HomeSearchQueryChanged extends HomeEvent {
  const HomeSearchQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class HomeSearchTabChanged extends HomeEvent {
  const HomeSearchTabChanged(this.tab);

  final int tab;

  @override
  List<Object?> get props => [tab];
}

class HomeNotificationPreferenceToggled extends HomeEvent {
  const HomeNotificationPreferenceToggled({
    required this.type,
    required this.isEnabled,
  });

  final HomeNotificationPreferenceType type;
  final bool isEnabled;

  @override
  List<Object?> get props => [type, isEnabled];
}

class HomeAppToggleChanged extends HomeEvent {
  const HomeAppToggleChanged({
    required this.type,
    required this.isEnabled,
  });

  final HomeAppToggleType type;
  final bool isEnabled;

  @override
  List<Object?> get props => [type, isEnabled];
}

class HomeAppFeedbackRated extends HomeEvent {
  const HomeAppFeedbackRated(this.rating);

  final int rating;

  @override
  List<Object?> get props => [rating];
}

class HomeFavoriteVendorSearchChanged extends HomeEvent {
  const HomeFavoriteVendorSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class HomeFavoriteVendorRemoved extends HomeEvent {
  const HomeFavoriteVendorRemoved(this.vendorId);

  final String vendorId;

  @override
  List<Object?> get props => [vendorId];
}

class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.categories = const [],
    this.filterCategories = const [],
    this.vendors = const [],
    this.allVendors = const [],
    this.reels = const [],
    this.profile = const HomeProfile(
      fullName: '',
      email: '',
      phoneNumber: '',
      location: '',
      memberSince: '',
      avatarPath: '',
      bookingsCount: 0,
      reviewsCount: 0,
      favoritesCount: 0,
      legalName: '',
      gender: '',
      dateOfBirth: '',
      address: '',
    ),
    this.notificationPreferences = const [],
    this.favoriteVendors = const [],
    this.selectedCategory = 'All',
    this.selectedFilterCategories = const ['All'],
    this.selectedRating = 1,
    this.selectedLanguage = 'English',
    this.darkModeEnabled = false,
    this.autoDownloadImagesEnabled = true,
    this.dataSaverModeEnabled = false,
    this.offlineModeEnabled = false,
    this.twoFactorAuthenticationEnabled = true,
    this.biometricLoginEnabled = false,
    this.appFeedbackRating = 0,
    this.minPrice = 10000,
    this.maxPrice = 500000,
    this.selectedAddress = 'Lekki Phase 1, Lagos',
    this.locationQuery = '',
    this.favoriteVendorQuery = '',
    this.selectedEnquiryStatus = HomeEnquiryStatus.pending,
    this.recentLocations = const [],
    this.locationSuggestions = const [],
    this.searchQuery = '',
    this.selectedSearchTab = 1,
  });

  final int currentIndex;
  final List<Category> categories;
  final List<String> filterCategories;
  final List<Vendor> vendors;
  final List<Vendor> allVendors;
  final List<HomeReel> reels;
  final HomeProfile profile;
  final List<HomeNotificationPreference> notificationPreferences;
  final List<Vendor> favoriteVendors;
  final String selectedCategory;
  final List<String> selectedFilterCategories;
  final int selectedRating;
  final String selectedLanguage;
  final bool darkModeEnabled;
  final bool autoDownloadImagesEnabled;
  final bool dataSaverModeEnabled;
  final bool offlineModeEnabled;
  final bool twoFactorAuthenticationEnabled;
  final bool biometricLoginEnabled;
  final int appFeedbackRating;
  final double minPrice;
  final double maxPrice;
  final String selectedAddress;
  final String locationQuery;
  final String favoriteVendorQuery;
  final HomeEnquiryStatus selectedEnquiryStatus;
  final List<String> recentLocations;
  final List<String> locationSuggestions;
  final String searchQuery;
  final int selectedSearchTab;

  HomeState copyWith({
    int? currentIndex,
    List<Category>? categories,
    List<String>? filterCategories,
    List<Vendor>? vendors,
    List<Vendor>? allVendors,
    List<HomeReel>? reels,
    HomeProfile? profile,
    List<HomeNotificationPreference>? notificationPreferences,
    List<Vendor>? favoriteVendors,
    String? selectedCategory,
    List<String>? selectedFilterCategories,
    int? selectedRating,
    String? selectedLanguage,
    bool? darkModeEnabled,
    bool? autoDownloadImagesEnabled,
    bool? dataSaverModeEnabled,
    bool? offlineModeEnabled,
    bool? twoFactorAuthenticationEnabled,
    bool? biometricLoginEnabled,
    int? appFeedbackRating,
    double? minPrice,
    double? maxPrice,
    String? selectedAddress,
    String? locationQuery,
    String? favoriteVendorQuery,
    HomeEnquiryStatus? selectedEnquiryStatus,
    List<String>? recentLocations,
    List<String>? locationSuggestions,
    String? searchQuery,
    int? selectedSearchTab,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      categories: categories ?? this.categories,
      filterCategories: filterCategories ?? this.filterCategories,
      vendors: vendors ?? this.vendors,
      allVendors: allVendors ?? this.allVendors,
      reels: reels ?? this.reels,
      profile: profile ?? this.profile,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
      favoriteVendors: favoriteVendors ?? this.favoriteVendors,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedFilterCategories:
          selectedFilterCategories ?? this.selectedFilterCategories,
      selectedRating: selectedRating ?? this.selectedRating,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      autoDownloadImagesEnabled:
          autoDownloadImagesEnabled ?? this.autoDownloadImagesEnabled,
      dataSaverModeEnabled: dataSaverModeEnabled ?? this.dataSaverModeEnabled,
      offlineModeEnabled: offlineModeEnabled ?? this.offlineModeEnabled,
      twoFactorAuthenticationEnabled:
          twoFactorAuthenticationEnabled ?? this.twoFactorAuthenticationEnabled,
      biometricLoginEnabled:
          biometricLoginEnabled ?? this.biometricLoginEnabled,
      appFeedbackRating: appFeedbackRating ?? this.appFeedbackRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      locationQuery: locationQuery ?? this.locationQuery,
      favoriteVendorQuery: favoriteVendorQuery ?? this.favoriteVendorQuery,
      selectedEnquiryStatus:
          selectedEnquiryStatus ?? this.selectedEnquiryStatus,
      recentLocations: recentLocations ?? this.recentLocations,
      locationSuggestions: locationSuggestions ?? this.locationSuggestions,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedSearchTab: selectedSearchTab ?? this.selectedSearchTab,
    );
  }

  @override
  List<Object?> get props => [
    currentIndex,
    categories,
    filterCategories,
    vendors,
    allVendors,
    reels,
    profile,
    notificationPreferences,
    favoriteVendors,
    selectedCategory,
    selectedFilterCategories,
    selectedRating,
    selectedLanguage,
    darkModeEnabled,
    autoDownloadImagesEnabled,
    dataSaverModeEnabled,
    offlineModeEnabled,
    twoFactorAuthenticationEnabled,
    biometricLoginEnabled,
    appFeedbackRating,
    minPrice,
    maxPrice,
    selectedAddress,
    locationQuery,
    favoriteVendorQuery,
    selectedEnquiryStatus,
    recentLocations,
    locationSuggestions,
    searchQuery,
    selectedSearchTab,
  ];
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_buildInitialState()) {
    on<HomeTabChanged>(_onTabChanged);
    on<HomeDataRequested>(_onDataRequested);
    on<HomeEnquiryStatusChanged>(_onEnquiryStatusChanged);
    on<HomeCategorySelected>(_onCategorySelected);
    on<HomeFilterCategoryToggled>(_onFilterCategoryToggled);
    on<HomeRatingChanged>(_onRatingChanged);
    on<HomePriceRangeChanged>(_onPriceRangeChanged);
    on<HomeLocationQueryChanged>(_onLocationQueryChanged);
    on<HomeLocationSelected>(_onLocationSelected);
    on<HomeSearchQueryChanged>(_onSearchQueryChanged);
    on<HomeSearchTabChanged>(_onSearchTabChanged);
    on<HomeNotificationPreferenceToggled>(_onNotificationPreferenceToggled);
    on<HomeAppToggleChanged>(_onAppToggleChanged);
    on<HomeAppFeedbackRated>(_onAppFeedbackRated);
    on<HomeFavoriteVendorSearchChanged>(_onFavoriteVendorSearchChanged);
    on<HomeFavoriteVendorRemoved>(_onFavoriteVendorRemoved);
  }

  void _onTabChanged(HomeTabChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onDataRequested(HomeDataRequested event, Emitter<HomeState> emit) {
    emit(_buildInitialState().copyWith(currentIndex: state.currentIndex));
  }

  void _onEnquiryStatusChanged(
    HomeEnquiryStatusChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedEnquiryStatus: event.status));
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

  void _onSearchQueryChanged(
    HomeSearchQueryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onSearchTabChanged(
    HomeSearchTabChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedSearchTab: event.tab));
  }

  void _onNotificationPreferenceToggled(
    HomeNotificationPreferenceToggled event,
    Emitter<HomeState> emit,
  ) {
    final updatedPreferences = state.notificationPreferences
        .map(
          (preference) => preference.type == event.type
              ? preference.copyWith(isEnabled: event.isEnabled)
              : preference,
        )
        .toList();

    emit(state.copyWith(notificationPreferences: updatedPreferences));
  }

  void _onAppToggleChanged(
    HomeAppToggleChanged event,
    Emitter<HomeState> emit,
  ) {
    switch (event.type) {
      case HomeAppToggleType.darkMode:
        emit(state.copyWith(darkModeEnabled: event.isEnabled));
      case HomeAppToggleType.autoDownloadImages:
        emit(state.copyWith(autoDownloadImagesEnabled: event.isEnabled));
      case HomeAppToggleType.dataSaverMode:
        emit(state.copyWith(dataSaverModeEnabled: event.isEnabled));
      case HomeAppToggleType.offlineMode:
        emit(state.copyWith(offlineModeEnabled: event.isEnabled));
      case HomeAppToggleType.twoFactorAuthentication:
        emit(
          state.copyWith(twoFactorAuthenticationEnabled: event.isEnabled),
        );
      case HomeAppToggleType.biometricLogin:
        emit(state.copyWith(biometricLoginEnabled: event.isEnabled));
    }
  }

  void _onAppFeedbackRated(
    HomeAppFeedbackRated event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(appFeedbackRating: event.rating));
  }

  void _onFavoriteVendorSearchChanged(
    HomeFavoriteVendorSearchChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(favoriteVendorQuery: event.query));
  }

  void _onFavoriteVendorRemoved(
    HomeFavoriteVendorRemoved event,
    Emitter<HomeState> emit,
  ) {
    final updatedFavorites = state.favoriteVendors
        .where((vendor) => vendor.id != event.vendorId)
        .toList();

    emit(state.copyWith(favoriteVendors: updatedFavorites));
  }

  static HomeState _buildInitialState() {
    const reels = [
      HomeReel(
        id: 'reel-1',
        title: 'Kenny & Femi',
        caption: 'Look at the glamor and the beauty of this decoration',
        imagePath: EventraImages.weddingPozeraImage,
        creatorAvatarPath: EventraImages.profileDummy,
        likeCount: 283,
        shareCount: 103,
        saveCount: 103,
      ),
      HomeReel(
        id: 'reel-2',
        title: 'Royal Garden Wedding',
        caption: 'A clean blend of elegance, style and event ambience.',
        imagePath: EventraImages.weddingPozeraImage,
        creatorAvatarPath: EventraImages.profileDummy,
        likeCount: 194,
        shareCount: 78,
        saveCount: 65,
      ),
      HomeReel(
        id: 'reel-3',
        title: 'Lagos Bridal Entry',
        caption: 'Moments like this deserve a timeless visual story.',
        imagePath: EventraImages.weddingPozeraImage,
        creatorAvatarPath: EventraImages.profileDummy,
        likeCount: 321,
        shareCount: 120,
        saveCount: 89,
      ),
    ];

    const profile = HomeProfile(
      fullName: 'Chioma Okafor',
      email: 'name@gmail.com',
      phoneNumber: '07064959727',
      location: 'Lagos, Nigeria',
      memberSince: 'January 2026',
      avatarPath: EventraImages.profileDummy,
      bookingsCount: 12,
      reviewsCount: 8,
      favoritesCount: 15,
      legalName: 'Kebokwu Ogechukwu Paul',
      gender: 'Male',
      dateOfBirth: '01_****_90',
      address: 'Lekki phase 1',
    );

    const notificationPreferences = [
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.pushNotifications,
        section: HomeNotificationPreferenceSection.general,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.emailNotifications,
        section: HomeNotificationPreferenceSection.general,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.smsNotifications,
        section: HomeNotificationPreferenceSection.general,
        isEnabled: false,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.bookingUpdates,
        section: HomeNotificationPreferenceSection.activity,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.messages,
        section: HomeNotificationPreferenceSection.activity,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.eventReminders,
        section: HomeNotificationPreferenceSection.activity,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.promotionsAndOffers,
        section: HomeNotificationPreferenceSection.marketing,
        isEnabled: true,
      ),
      HomeNotificationPreference(
        type: HomeNotificationPreferenceType.newVendors,
        section: HomeNotificationPreferenceSection.marketing,
        isEnabled: false,
      ),
    ];

    const favoriteVendors = [
      Vendor(
        id: 'favorite-001',
        name: '360 Events',
        category: 'Decor.',
        rating: 4.8,
        reviewsCount: 253,
        image: EventraImages.weddingImage,
        location: 'Lekki, Lagos',
        startingPrice: 180000,
        isFavorite: true,
      ),
      Vendor(
        id: 'favorite-002',
        name: 'Dj Swanky',
        category: 'DJs',
        rating: 4.8,
        reviewsCount: 253,
        image: EventraImages.decoratorPerson,
        location: 'Ikeja, Lagos',
        startingPrice: 220000,
        isFavorite: true,
      ),
      Vendor(
        id: 'favorite-003',
        name: 'Pozera Events',
        category: 'Djs',
        rating: 4.8,
        reviewsCount: 253,
        image: EventraImages.womanWithweddinggown,
        location: 'Victoria Island, Lagos',
        startingPrice: 160000,
        isFavorite: true,
      ),
      Vendor(
        id: 'favorite-004',
        name: 'SZ Photos',
        category: 'Photographer',
        rating: 4.8,
        reviewsCount: 253,
        image: EventraImages.cameramanImage,
        location: 'Surulere, Lagos',
        startingPrice: 140000,
        isFavorite: true,
      ),
    ];

    const categories = [
      Category(name: 'Rental', icon: EventraImages.rentalCategoryIcon),
      Category(name: 'Decorator', icon: EventraImages.decoratorCategoryIcon),
      Category(name: 'Cakes', icon: EventraImages.cakesCategoryIcon),
      Category(name: 'MC', icon: EventraImages.mcCategoryImage),
      Category(name: 'DJ', icon: EventraImages.djCategoryImage),
      Category(name: 'Caterer', icon: EventraImages.catererCategoryImage),
      Category(
        name: 'Photography',
        icon: EventraImages.photographyCategoryImage,
      ),
      Category(
        name: 'Content Creator',
        icon: EventraImages.contentCreatorCategoryImage,
      ),
      Category(
        name: 'Event Planner',
        icon: EventraImages.eventplannerCategoryImage,
      ),
      Category(name: 'Hall', icon: EventraImages.hallCategoryImage),
      Category(name: 'Lightning', icon: EventraImages.ligntningCategoryImage),
      Category(name: 'Drinks', icon: EventraImages.drinksCategoryImage),
      Category(
        name: 'Wedding Dress',
        icon: EventraImages.weddingDressCategoryImage,
      ),
      Category(
        name: 'Videographer',
        icon: EventraImages.videographerCategoryImage,
      ),
      Category(name: 'Bouncers', icon: EventraImages.bouncersCategoryImage),
      Category(
        name: 'Wedding Stylist',
        icon: EventraImages.weddingStylistCategoryImage,
      ),
      Category(
        name: 'Small Chops',
        icon: EventraImages.smallChopsCategoryImage,
      ),
      Category(name: 'Live Band', icon: EventraImages.liveBandCategoryImage),
      Category(
        name: 'Hair Stylist',
        icon: EventraImages.hairStylistCategoryImage,
      ),
      Category(name: 'Caterer', icon: EventraImages.catererCategoryImage),
      Category(
        name: 'Photography',
        icon: EventraImages.photographyCategoryImage,
      ),
      Category(name: 'Usher', icon: EventraImages.usherCategoryImage),
      Category(name: 'Orders', icon: ''),
    ];

    const filterCategories = [
      'Event Planner',
      'Cakes',
      'Hall',
      'Decorator',
      'Lightning',
      'Drinks',
      'Wedding Dress',
      'Rental',
      'DJ',
      'Make-up',
      'Videographer',
      'MC',
      'Bouncers',
      'Content Creator',
      'Wedding Stylist',
      'Small Chops',
      'Live Band',
      'Hair Stylist',
      'Caterer',
      'Photography',
      'Usher',
      'Orders',
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
        id: 'vendor-004',
        name: 'Foodies Event',
        category: 'Catering',
        rating: 4.9,
        reviewsCount: 120,
        image: EventraImages.weddingImage,
        location: 'Lekki, Lagos',
        startingPrice: 180000,
        isFavorite: true,
      ),
      Vendor(
        id: 'vendor-002',
        name: 'Swift Pixel',
        category: 'Photography',
        rating: 4.8,
        reviewsCount: 86,
        image: EventraImages.cameramanImage,
        location: 'Victoria Island, Lagos',
        startingPrice: 220000,
      ),
      Vendor(
        id: 'vendor-003',
        name: 'Wedding Grove',
        category: 'Decor',
        rating: 4.7,
        reviewsCount: 114,
        image: EventraImages.womanWithfoodplate,
        location: 'Ikoyi, Lagos',
        startingPrice: 150000,
      ),
      Vendor(
        id: 'vendor-001',
        name: 'Zin Events',
        category: 'MC',
        rating: 4.8,
        reviewsCount: 42,
        image: EventraImages.weddingImage,
        location: 'Surulere, Lagos',
        startingPrice: 90000,
      ),
    ];

    const initialState = HomeState(
      categories: categories,
      filterCategories: filterCategories,
      allVendors: allVendors,
      vendors: allVendors,
      reels: reels,
      profile: profile,
      notificationPreferences: notificationPreferences,
      favoriteVendors: favoriteVendors,
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
