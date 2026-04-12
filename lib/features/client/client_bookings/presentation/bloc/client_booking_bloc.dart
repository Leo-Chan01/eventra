import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/client_bookings/domain/models/enquiry.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BookingStatus { idle, formSubmitted, reviewingEnquiry, submitted }

abstract class ClientBookingEvent extends Equatable {
  const ClientBookingEvent();

  @override
  List<Object?> get props => [];
}

class EnquiryFormInitiated extends ClientBookingEvent {
  const EnquiryFormInitiated({
    required this.vendorId,
    required this.vendorName,
    required this.catalogItem,
  });

  final String vendorId;
  final String vendorName;
  final CatalogItem catalogItem;

  @override
  List<Object?> get props => [vendorId, vendorName, catalogItem];
}

class EnquiryFormFieldChanged extends ClientBookingEvent {
  const EnquiryFormFieldChanged({
    this.eventType,
    this.location,
    this.guestCount,
    this.budget,
    this.eventDate,
    this.notes,
    this.imageUrls,
  });

  final String? eventType;
  final String? location;
  final int? guestCount;
  final String? budget;
  final DateTime? eventDate;
  final String? notes;
  final List<String>? imageUrls;

  @override
  List<Object?> get props => [
    eventType,
    location,
    guestCount,
    budget,
    eventDate,
    notes,
    imageUrls,
  ];
}

class EnquiryReviewRequested extends ClientBookingEvent {
  const EnquiryReviewRequested();
}

class EnquirySubmitted extends ClientBookingEvent {
  const EnquirySubmitted({
    required this.vendorId,
    required this.vendorName,
    required this.catalogItemTitle,
  });

  final String vendorId;
  final String vendorName;
  final String catalogItemTitle;

  @override
  List<Object?> get props => [vendorId, vendorName, catalogItemTitle];
}

class EnquiryReset extends ClientBookingEvent {
  const EnquiryReset();
}

class ClientBookingState extends Equatable {
  const ClientBookingState({
    this.status = BookingStatus.idle,
    this.enquiry,
    this.enquiryVendorName = '',
    this.enquiryCatalogItemTitle = '',
    this.enquiryVendorId = '',
  });

  final BookingStatus status;
  final Enquiry? enquiry;
  final String enquiryVendorName;
  final String enquiryCatalogItemTitle;
  final String enquiryVendorId;

  ClientBookingState copyWith({
    BookingStatus? status,
    Enquiry? enquiry,
    String? enquiryVendorName,
    String? enquiryCatalogItemTitle,
    String? enquiryVendorId,
  }) {
    return ClientBookingState(
      status: status ?? this.status,
      enquiry: enquiry ?? this.enquiry,
      enquiryVendorName: enquiryVendorName ?? this.enquiryVendorName,
      enquiryCatalogItemTitle:
          enquiryCatalogItemTitle ?? this.enquiryCatalogItemTitle,
      enquiryVendorId: enquiryVendorId ?? this.enquiryVendorId,
    );
  }

  @override
  List<Object?> get props => [
    status,
    enquiry,
    enquiryVendorName,
    enquiryCatalogItemTitle,
    enquiryVendorId,
  ];
}

class ClientBookingBloc extends Bloc<ClientBookingEvent, ClientBookingState> {
  ClientBookingBloc() : super(const ClientBookingState()) {
    on<EnquiryFormInitiated>(_onEnquiryFormInitiated);
    on<EnquiryFormFieldChanged>(_onEnquiryFormFieldChanged);
    on<EnquiryReviewRequested>(_onEnquiryReviewRequested);
    on<EnquirySubmitted>(_onEnquirySubmitted);
    on<EnquiryReset>(_onEnquiryReset);
  }

  void _onEnquiryFormInitiated(
    EnquiryFormInitiated event,
    Emitter<ClientBookingState> emit,
  ) {
    final enquiry = Enquiry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      vendorId: event.vendorId,
      vendorName: event.vendorName,
      catalogItemTitle: event.catalogItem.title,
      message: '',
    );

    emit(
      state.copyWith(
        status: BookingStatus.formSubmitted,
        enquiry: enquiry,
        enquiryVendorName: event.vendorName,
        enquiryCatalogItemTitle: event.catalogItem.title,
        enquiryVendorId: event.vendorId,
      ),
    );
  }

  void _onEnquiryFormFieldChanged(
    EnquiryFormFieldChanged event,
    Emitter<ClientBookingState> emit,
  ) {
    if (state.enquiry == null) return;

    final updatedEnquiry = state.enquiry!.copyWith(
      eventType: event.eventType ?? state.enquiry!.eventType,
      location: event.location ?? state.enquiry!.location,
      guestCount: event.guestCount ?? state.enquiry!.guestCount,
      budget: event.budget ?? state.enquiry!.budget,
      eventDate: event.eventDate ?? state.enquiry!.eventDate,
      notes: event.notes ?? state.enquiry!.notes,
      imageUrls: event.imageUrls ?? state.enquiry!.imageUrls,
    );

    emit(state.copyWith(enquiry: updatedEnquiry));
  }

  void _onEnquiryReviewRequested(
    EnquiryReviewRequested event,
    Emitter<ClientBookingState> emit,
  ) {
    emit(state.copyWith(status: BookingStatus.reviewingEnquiry));
  }

  void _onEnquirySubmitted(
    EnquirySubmitted event,
    Emitter<ClientBookingState> emit,
  ) {
    emit(
      state.copyWith(
        status: BookingStatus.submitted,
        enquiryVendorName: event.vendorName,
        enquiryCatalogItemTitle: event.catalogItemTitle,
        enquiryVendorId: event.vendorId,
      ),
    );
  }

  void _onEnquiryReset(
    EnquiryReset event,
    Emitter<ClientBookingState> emit,
  ) {
    emit(const ClientBookingState());
  }
}
