import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BookingStatus { idle, submitted }

abstract class ClientBookingEvent extends Equatable {
  const ClientBookingEvent();

  @override
  List<Object?> get props => [];
}

class EnquirySubmitted extends ClientBookingEvent {
  const EnquirySubmitted({
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

class EnquiryReset extends ClientBookingEvent {
  const EnquiryReset();
}

class ClientBookingState extends Equatable {
  const ClientBookingState({
    this.status = BookingStatus.idle,
    this.enquiryVendorName = '',
    this.enquiryCatalogItemTitle = '',
    this.enquiryVendorId = '',
  });

  final BookingStatus status;
  final String enquiryVendorName;
  final String enquiryCatalogItemTitle;
  final String enquiryVendorId;

  ClientBookingState copyWith({
    BookingStatus? status,
    String? enquiryVendorName,
    String? enquiryCatalogItemTitle,
    String? enquiryVendorId,
  }) {
    return ClientBookingState(
      status: status ?? this.status,
      enquiryVendorName: enquiryVendorName ?? this.enquiryVendorName,
      enquiryCatalogItemTitle:
          enquiryCatalogItemTitle ?? this.enquiryCatalogItemTitle,
      enquiryVendorId: enquiryVendorId ?? this.enquiryVendorId,
    );
  }

  @override
  List<Object?> get props => [
    status,
    enquiryVendorName,
    enquiryCatalogItemTitle,
    enquiryVendorId,
  ];
}

class ClientBookingBloc extends Bloc<ClientBookingEvent, ClientBookingState> {
  ClientBookingBloc() : super(const ClientBookingState()) {
    on<EnquirySubmitted>(_onEnquirySubmitted);
    on<EnquiryReset>(_onEnquiryReset);
  }

  void _onEnquirySubmitted(
    EnquirySubmitted event,
    Emitter<ClientBookingState> emit,
  ) {
    emit(
      state.copyWith(
        status: BookingStatus.submitted,
        enquiryVendorName: event.vendorName,
        enquiryCatalogItemTitle: event.catalogItem.title,
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
