import 'package:eventra/core/utils/custom_log_file.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/event_type_dropdown.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_date_picker_textfield.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class EnquiryFormPageArgs {
  const EnquiryFormPageArgs({
    required this.vendorId,
    required this.vendorName,
    required this.vendorImage,
    required this.catalogItem,
  });

  final String vendorId;
  final String vendorName;
  final String vendorImage;
  final CatalogItem catalogItem;
}

class EnquiryFormPage extends StatefulWidget {
  const EnquiryFormPage({super.key});

  static const String path = '/enquiry-form';
  static const String name = 'enquiry-form';

  @override
  State<EnquiryFormPage> createState() => _EnquiryFormPageState();
}

class _EnquiryFormPageState extends State<EnquiryFormPage> {
  late final EnquiryFormPageArgs _args;
  bool _didInitArgs = false;

  String _selectedEventType = '';
  String _location = '';
  int? _guestCount;
  String _selectedBudget = '';
  String _selectedDate = '';
  String _notes = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInitArgs) {
      return;
    }

    _args = GoRouterState.of(context).extra! as EnquiryFormPageArgs;
    _didInitArgs = true;

    context.read<ClientBookingBloc>().add(
      EnquiryFormInitiated(
        vendorId: _args.vendorId,
        vendorName: _args.vendorName,
        catalogItem: _args.catalogItem,
      ),
    );
  }

  Future<void> _onReviewPressed() async {
    kLogs('Event Type: $_selectedEventType');
    kLogs('Location: $_location');
    kLogs('Guest Count: $_guestCount');
    kLogs('Budget: $_selectedBudget');
    kLogs('Date: $_selectedDate');
    kLogs('Notes: $_notes');

    // Validate form fields
    if (_selectedEventType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.enquiryFormEventType)),
      );
      return;
    }

    // Update the bloc with form data
    context.read<ClientBookingBloc>().add(
      EnquiryFormFieldChanged(
        eventType: _selectedEventType,
        location: _location,
        guestCount: _guestCount,
        budget: _selectedBudget,
        eventDate: _selectedDate.isNotEmpty ? _parseDate(_selectedDate) : null,
        notes: _notes,
      ),
    );

    // Move to review page
    context.read<ClientBookingBloc>().add(
      const EnquiryReviewRequested(),
    );

    if (mounted) {
      await context.pushNamed(EnquiryReviewPage.name);
    }
  }

  DateTime? _parseDate(String dateString) {
    // Parse DD/MM/YYYY format from the date picker
    try {
      final parts = dateString.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    } catch (e) {
      kLogs('Error parsing date: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientBookingBloc, ClientBookingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(l10n.enquiryFormTitle),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    // Vendor Header
                    _buildVendorHeader(context),

                    // Form Fields
                    EventTypeDropdown(
                      onChanged: (value) {
                        setState(() {
                          _selectedEventType = value;
                        });
                      },
                    ),

                    EventraGeneralTextfield(
                      hint: l10n.enquiryFormLocationHint,
                      label: l10n.enquiryFormLocation,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          _location = value;
                        });
                      },
                    ),

                    EventraGeneralTextfield(
                      hint: l10n.enquiryFormGuestCountHint,
                      label: l10n.enquiryFormGuestCount,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _guestCount = int.tryParse(value);
                        });
                      },
                    ),

                    _buildBudgetDropdown(context),

                    EventraDatePickerTextfield(
                      label: l10n.enquiryFormEventDate,
                      hint: l10n.enquiryFormEventDateHint,
                      onChanged: (value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),

                    EventraGeneralTextfield(
                      hint: l10n.enquiryFormNotesHint,
                      label: l10n.enquiryFormNotes,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        setState(() {
                          _notes = value;
                        });
                      },
                    ),

                    // Image Upload Section - Placeholder for now
                    _buildImageUploadSection(context),

                    32.vertSpacing,

                    // Review Button
                    EventraButton(
                      buttonText: l10n.enquiryFormReviewButton,
                      onPressed: _onReviewPressed,
                      width: double.infinity,
                    ),

                    16.vertSpacing,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVendorHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                _args.vendorImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  _args.vendorName,
                  style: 14.w600.copyWith(color: colorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _args.catalogItem.title,
                  style: 12.w400.copyWith(color: colorScheme.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetDropdown(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    final budgetOptions = [
      MapEntry(l10n.budgetRangeLow, 'low'),
      MapEntry(l10n.budgetRangeMedium, 'medium'),
      MapEntry(l10n.budgetRangeHigh, 'high'),
      MapEntry(l10n.budgetRangeVeryHigh, 'veryHigh'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.enquiryFormBudget,
          style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        DropdownMenu<String>(
          onSelected: (value) {
            if (value != null) {
              setState(() {
                _selectedBudget = value;
              });
            }
          },
          dropdownMenuEntries: budgetOptions
              .map(
                (entry) => DropdownMenuEntry(
                  value: entry.value,
                  label: entry.key,
                ),
              )
              .toList(),
          hintText: l10n.enquiryFormBudgetHint,
          expandedInsets: EdgeInsets.zero,
          width: double.infinity - 32,
        ),
      ],
    );
  }

  Widget _buildImageUploadSection(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.outline,
          // style: BorderStyle.solid,
          width: 2,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 8,
        children: [
          Icon(
            Icons.image_outlined,
            color: colorScheme.primary,
            size: 32,
          ),
          Text(
            l10n.enquiryFormImages,
            style: 14.w600.copyWith(color: colorScheme.onSurface),
          ),
          Text(
            l10n.enquiryFormImagesHint,
            style: 12.w400.copyWith(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class EnquiryReviewPage extends StatelessWidget {
  const EnquiryReviewPage({super.key});

  static const String path = '/enquiry-review';
  static const String name = 'enquiry-review';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientBookingBloc, ClientBookingState>(
      builder: (context, state) {
        final enquiry = state.enquiry;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(l10n.enquiryReviewTitle),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    // Vendor Header
                    _buildVendorHeader(context, state),

                    // Event Details Section
                    if (enquiry != null) ...[
                      _buildDetailRow(
                        context,
                        l10n.enquiryReviewEventType,
                        enquiry.eventType ?? 'N/A',
                      ),
                      Divider(color: colorScheme.outlineVariant),
                      _buildDetailRow(
                        context,
                        l10n.enquiryReviewLocation,
                        enquiry.location ?? 'N/A',
                      ),
                      Divider(color: colorScheme.outlineVariant),
                      _buildDetailRow(
                        context,
                        l10n.enquiryReviewGuestCount,
                        enquiry.guestCount != null
                            ? '${enquiry.guestCount} guests'
                            : 'N/A',
                      ),
                      Divider(color: colorScheme.outlineVariant),
                      _buildDetailRow(
                        context,
                        l10n.enquiryReviewBudget,
                        enquiry.budget ?? 'N/A',
                      ),
                      Divider(color: colorScheme.outlineVariant),
                      _buildDetailRow(
                        context,
                        l10n.enquiryReviewEventDate,
                        enquiry.eventDate != null
                            ? intl.DateFormat(
                                'MMM dd, yyyy',
                              ).format(enquiry.eventDate!)
                            : 'N/A',
                      ),
                      if (enquiry.notes != null &&
                          enquiry.notes!.isNotEmpty) ...[
                        Divider(color: colorScheme.outlineVariant),
                        _buildDetailRow(
                          context,
                          l10n.enquiryReviewNotes,
                          enquiry.notes!,
                          isMultiline: true,
                        ),
                      ],
                    ],

                    // Inspiration Gallery Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.enquiryReviewInspiration,
                            style: 14.w600.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              separatorBuilder: (context, index) =>
                                  12.horizSpacing,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: colorScheme.outlineVariant,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: colorScheme.onSurfaceVariant,
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    32.vertSpacing,

                    // Send Button
                    EventraButton(
                      buttonText: l10n.enquiryReviewSendButton,
                      onPressed: () => _onSendPressed(context),
                      width: double.infinity,
                    ),

                    16.vertSpacing,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVendorHeader(BuildContext context, ClientBookingState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.business,
                color: colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  state.enquiryVendorName,
                  style: 14.w600.copyWith(color: colorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  state.enquiryCatalogItemTitle,
                  style: 12.w400.copyWith(color: colorScheme.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isMultiline = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            label,
            style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          Text(
            value,
            style: 14.w400.copyWith(color: colorScheme.onSurface),
            maxLines: isMultiline ? null : 1,
            overflow: isMultiline
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Future<void> _onSendPressed(BuildContext context) async {
    final state = context.read<ClientBookingState>();
    context.read<ClientBookingBloc>().add(
      EnquirySubmitted(
        vendorId: state.enquiryVendorId,
        vendorName: state.enquiryVendorName,
        catalogItemTitle: state.enquiryCatalogItemTitle,
      ),
    );

    await context.pushNamed(EnquirySentPage.name);
  }
}
