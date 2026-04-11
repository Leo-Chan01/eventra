import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_review.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_video.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class VendorDetailEvent extends Equatable {
  const VendorDetailEvent();

  @override
  List<Object?> get props => [];
}

class VendorSelected extends VendorDetailEvent {
  const VendorSelected(this.vendorId);

  final String vendorId;

  @override
  List<Object?> get props => [vendorId];
}

class VendorDetailTabChanged extends VendorDetailEvent {
  const VendorDetailTabChanged(this.tab);

  final int tab;

  @override
  List<Object?> get props => [tab];
}

class VendorDetailState extends Equatable {
  const VendorDetailState({
    this.vendors = const [],
    this.selectedVendorId = '',
    this.selectedTab = 0,
  });

  final List<VendorDetail> vendors;
  final String selectedVendorId;
  final int selectedTab;

  VendorDetail get selectedVendor => vendors.firstWhere(
    (v) => v.id == selectedVendorId,
    orElse: () => vendors.isNotEmpty ? vendors.first : _emptyVendor,
  );

  VendorDetailState copyWith({
    List<VendorDetail>? vendors,
    String? selectedVendorId,
    int? selectedTab,
  }) {
    return VendorDetailState(
      vendors: vendors ?? this.vendors,
      selectedVendorId: selectedVendorId ?? this.selectedVendorId,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [vendors, selectedVendorId, selectedTab];
}

class VendorDetailBloc extends Bloc<VendorDetailEvent, VendorDetailState> {
  VendorDetailBloc() : super(_buildInitialState()) {
    on<VendorSelected>(_onVendorSelected);
    on<VendorDetailTabChanged>(_onVendorDetailTabChanged);
  }

  void _onVendorSelected(
    VendorSelected event,
    Emitter<VendorDetailState> emit,
  ) {
    emit(state.copyWith(selectedVendorId: event.vendorId, selectedTab: 0));
  }

  void _onVendorDetailTabChanged(
    VendorDetailTabChanged event,
    Emitter<VendorDetailState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.tab));
  }

  static VendorDetailState _buildInitialState() {
    final pozera = _buildPozeraEvents();
    final vendors = [
      pozera,
      _buildSwiftPixel(pozera),
      _buildWeddingGrove(pozera),
      _buildFoodiesEvent(pozera),
    ];
    return VendorDetailState(
      vendors: vendors,
      selectedVendorId: vendors.first.id,
    );
  }

  static VendorDetail _buildPozeraEvents() {
    const catalogItems = [
      CatalogItem(
        id: 'cat-001',
        title: 'Intimate Event Deco...',
        description:
            'This is an intimate decoration and its comes with different styles.',
        price: 10000,
        image: EventraImages.weddingImage,
        whatToExpect: [
          '3 Different outfits',
          '20 edited pictures',
          '2 Days Delivery',
        ],
      ),
      CatalogItem(
        id: 'cat-002',
        title: 'Pre-wedding Photoshoot',
        description:
            'This is an intimate decoration and its comes with different styles.',
        price: 500000,
        image: EventraImages.weddingImage,
        whatToExpect: [
          '3 Different outfits',
          '20 edited pictures',
          '2 Days Delivery',
        ],
        images: [
          EventraImages.weddingImage,
          EventraImages.onboardingImage2,
          EventraImages.cameramanImage,
          EventraImages.femaleWeddingPlannerWorkingCeremony1,
        ],
      ),
      CatalogItem(
        id: 'cat-003',
        title: 'Intimate Event Deco...',
        description:
            'This is an intimate decoration and its comes with different styles.',
        price: 10000,
        image: EventraImages.weddingImage,
        whatToExpect: [
          '3 Different outfits',
          '20 edited pictures',
          '2 Days Delivery',
        ],
      ),
      CatalogItem(
        id: 'cat-004',
        title: 'Intimate Event Deco...',
        description:
            'This is an intimate decoration and its comes with different styles.',
        price: 10000,
        image: EventraImages.onboardingImage2,
        whatToExpect: [
          '3 Different outfits',
          '20 edited pictures',
          '2 Days Delivery',
        ],
      ),
    ];

    const reviews = [
      VendorReview(
        id: 'rev-001',
        reviewerName: 'Moses Simon',
        reviewerAvatar: EventraImages.weddingImage,
        rating: 4.5,
        date: '20-06-2025',
        body:
            'Pozera Event is a mobile and web-based platform that connects individuals and organizations planning events with trusted event service providers including event decorators, planners, venues, caterers, photographers and more.',
      ),
      VendorReview(
        id: 'rev-002',
        reviewerName: 'Moses Simon',
        reviewerAvatar: EventraImages.weddingImage,
        rating: 4.0,
        date: '25-01-2025',
        body:
            'Pozera Event is a mobile and web-based platform that connects individuals and organizations planning events with trusted event service providers.',
      ),
      VendorReview(
        id: 'rev-003',
        reviewerName: 'Moses Simon',
        reviewerAvatar: EventraImages.weddingImage,
        rating: 3.5,
        date: '25-01-2025',
        body:
            'Pozera Event is a mobile and web-based platform that connects individuals and organizations planning events with trusted event service providers.',
      ),
    ];

    const relatedVendors = [
      RelatedVendor(
        id: 'vendor-rel-001',
        name: 'Pozera Events',
        image: EventraImages.weddingImage,
        category: 'Decor',
        location: 'Lagos',
        rating: 4.85,
      ),
      RelatedVendor(
        id: 'vendor-rel-002',
        name: 'Crystal Photos',
        image: EventraImages.weddingImage,
        category: 'Photography',
        location: 'Lagos',
        rating: 4.70,
      ),
    ];

    return const VendorDetail(
      id: 'vendor-001',
      name: 'Pozera Events',
      bio:
          'Pozera Events is a creative event planning and decoration company specializing in turning your special moments into unforgettable experiences. From weddings and birthdays to corporate events and more, we bring style, elegance, and precision to every celebration.',
      tags: ['Decorator', 'Planner'],
      rating: 4.85,
      reviewsCount: 380,
      coverImage: EventraImages.weddingImage,
      profileImage: EventraImages.weddingImage,
      location: 'Lagos',
      followersCount: 1400,
      services: [
        'Full Venue Decoration',
        'Table & Chair Setup',
        'Lighting',
        'Stage Setup',
      ],
      catalogItems: catalogItems,
      videos: [
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 300),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 30),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 500),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 400),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 300),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 100),
      ],
      reviews: reviews,
      relatedVendors: relatedVendors,
      isVerified: true,
      isTopRated: true,
      isIdVerified: true,
      isBackgroundChecked: true,
      hasVerificationBadge: true,
    );
  }

  static VendorDetail _buildSwiftPixel(VendorDetail pozera) {
    return VendorDetail(
      id: 'vendor-002',
      name: 'Swift Pixel',
      bio:
          'Swift Pixel is a professional photography and videography studio capturing your most important events with cinematic precision and artistry.',
      tags: const ['Photographer', 'Videographer'],
      rating: 4.8,
      reviewsCount: 86,
      coverImage: EventraImages.weddingImage,
      profileImage: EventraImages.weddingImage,
      location: 'Victoria Island, Lagos',
      followersCount: 980,
      services: const [
        'Wedding Photography',
        'Portrait Sessions',
        'Videography',
        'Drone Coverage',
      ],
      catalogItems: const [
        CatalogItem(
          id: 'cat-sp-001',
          title: 'Pre-wedding Photoshoot',
          description:
              'A beautiful pre-wedding session to celebrate your love story.',
          price: 250000,
          image: EventraImages.weddingImage,
          whatToExpect: [
            '4 Hours of shooting',
            '50 edited pictures',
            '3 Days Delivery',
          ],
        ),
        CatalogItem(
          id: 'cat-sp-002',
          title: 'Wedding Full Package',
          description:
              'Complete wedding day coverage from preparation to reception.',
          price: 750000,
          image: EventraImages.weddingImage,
          whatToExpect: [
            'Full day coverage',
            '200 edited pictures',
            '7 Days Delivery',
          ],
        ),
      ],
      videos: const [
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 300),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 120),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 240),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 80),
      ],
      reviews: pozera.reviews,
      relatedVendors: pozera.relatedVendors,
      isVerified: true,
      isTopRated: false,
      isIdVerified: true,
      isBackgroundChecked: true,
      hasVerificationBadge: false,
    );
  }

  static VendorDetail _buildWeddingGrove(VendorDetail pozera) {
    return VendorDetail(
      id: 'vendor-003',
      name: 'Wedding Grove',
      bio:
          'Wedding Grove specialises in creating breathtaking wedding décor and floral arrangements that transform any venue into a magical setting.',
      tags: const ['Decorator', 'Florist'],
      rating: 4.7,
      reviewsCount: 114,
      coverImage: EventraImages.weddingImage,
      profileImage: EventraImages.weddingImage,
      location: 'Ikoyi, Lagos',
      followersCount: 1200,
      services: const [
        'Floral Arrangements',
        'Venue Transformation',
        'Table Centrepieces',
        'Arch Setup',
      ],
      catalogItems: const [
        CatalogItem(
          id: 'cat-wg-001',
          title: 'Classic Wedding Package',
          description: 'Elegant floral décor for intimate weddings.',
          price: 150000,
          image: EventraImages.weddingImage,
          whatToExpect: [
            'Full venue flowers',
            'Bridal bouquet',
            '2 Days Setup',
          ],
        ),
      ],
      videos: const [
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 300),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 30),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 500),
      ],
      reviews: pozera.reviews,
      relatedVendors: pozera.relatedVendors,
      isVerified: true,
      isTopRated: true,
      isIdVerified: true,
      isBackgroundChecked: false,
      hasVerificationBadge: true,
    );
  }

  static VendorDetail _buildFoodiesEvent(VendorDetail pozera) {
    return VendorDetail(
      id: 'vendor-004',
      name: 'Foodies Event',
      bio:
          'Foodies Event provides top-tier catering services for all types of events. We bring gourmet flavours to every celebration.',
      tags: const ['Catering', 'Chef'],
      rating: 4.9,
      reviewsCount: 120,
      coverImage: EventraImages.weddingImage,
      profileImage: EventraImages.weddingImage,
      location: 'Lekki, Lagos',
      followersCount: 2100,
      services: const [
        'Buffet Service',
        'Cocktail Catering',
        'Private Chef',
        'Event Snacks',
      ],
      catalogItems: const [
        CatalogItem(
          id: 'cat-fe-001',
          title: 'Corporate Buffet',
          description:
              'Full buffet setup for corporate events and team lunches.',
          price: 180000,
          image: EventraImages.weddingImage,
          whatToExpect: [
            '3-course meal',
            'Service staff included',
            '1 Day Setup',
          ],
        ),
      ],
      videos: const [
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 300),
        VendorVideo(thumbnailUrl: EventraImages.weddingImage, viewCount: 100),
      ],
      reviews: pozera.reviews,
      relatedVendors: pozera.relatedVendors,
      isVerified: true,
      isTopRated: true,
      isIdVerified: true,
      isBackgroundChecked: true,
      hasVerificationBadge: true,
    );
  }
}

const _emptyVendor = VendorDetail(
  id: '',
  name: '',
  bio: '',
  tags: [],
  rating: 0,
  reviewsCount: 0,
  coverImage: '',
  profileImage: '',
  location: '',
  followersCount: 0,
  services: [],
  catalogItems: [],
  videos: [],
  reviews: [],
  relatedVendors: [],
);
