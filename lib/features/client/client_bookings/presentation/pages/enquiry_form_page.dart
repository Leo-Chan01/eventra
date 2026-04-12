import 'package:eventra/core/utils/custom_log_file.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_review_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_form_upload_tiles.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
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
    this.vendorCategory,
    this.vendorRating,
    this.vendorReviewsCount,
  });

  final String vendorId;
  final String vendorName;
  final String vendorImage;
  final CatalogItem catalogItem;
  final String? vendorCategory;
  final double? vendorRating;
  final int? vendorReviewsCount;
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
  DateTime? _selectedEventDateTime;

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _guestCountController = TextEditingController();
  final TextEditingController _budgetMinController = TextEditingController();
  final TextEditingController _budgetMaxController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    _guestCountController.dispose();
    _budgetMinController.dispose();
    _budgetMaxController.dispose();
    _notesController.dispose();
    super.dispose();
  }

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

    _selectedEventType = 'weddings';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final eventTypeOptions = <MapEntry<String, String>>[
      MapEntry('weddings', l10n.eventTypeWeddings),
      MapEntry('birthday', l10n.eventTypeBirthday),
      MapEntry('anniversary', l10n.eventTypeAnniversary),
      MapEntry('engagement', l10n.eventTypeEngagement),
      MapEntry('corporate', l10n.eventTypeCorporate),
      MapEntry('conference', l10n.eventTypeConference),
      MapEntry('walkathon', l10n.eventTypeWalkathon),
      MapEntry('other', l10n.eventTypeOther),
    ];
    final selectedEventTypeLabel = eventTypeOptions
        .firstWhere(
          (entry) => entry.key == _selectedEventType,
          orElse: () => eventTypeOptions.first,
        )
        .value;
    final inputFillColor = colorScheme.surfaceContainerHighest.withValues(
      alpha: 0.45,
    );
    final inputTextStyle = 17.w500.copyWith(color: colorScheme.onSurface);
    final inputHintStyle = 17.w400.copyWith(
      color: colorScheme.onSurfaceVariant,
    );
    final dateLabel = _selectedEventDateTime == null
        ? l10n.enquiryFormEventDateHint
        : intl.DateFormat('MMMM d, yyyy    h:mm a').format(
            _selectedEventDateTime!,
          );
    final ratingLabel =
        (_args.vendorRating != null && _args.vendorReviewsCount != null)
        ? l10n.enquiryFlowPendingRating(
            _args.vendorRating!.toStringAsFixed(1),
            _args.vendorReviewsCount!,
          )
        : null;

    return BlocBuilder<ClientBookingBloc, ClientBookingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.enquiryFormTitle,
              style: 20.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EnquiryFlowVendorCard.minimal(
                    vendorName: _args.vendorName,
                    vendorImage: _args.vendorImage,
                    subtitle: _args.vendorCategory ?? _args.catalogItem.title,
                    ratingLabel: l10n.enquiryFlowPendingRating('4.8', 342),
                    onMessageVendor: () {
                      GlobalSnackBar.showInfo(
                        l10n.notificationsContactVendorFeedback,
                      );
                    },
                    dateIssuedLabel: '',
                    statusLabel: '',
                    statusValue: '',
                    statusColor: colorScheme.primary,
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormEventType,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  InkWell(
                    onTap: () async {
                      final selectedKey = await _showEventTypePicker(
                        eventTypeOptions,
                      );
                      if (selectedKey != null) {
                        setState(() {
                          _selectedEventType = selectedKey;
                        });
                      }
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: inputFillColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedEventTypeLabel, style: inputTextStyle),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 34,
                            color: colorScheme.onSurface,
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormLocation,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  TextField(
                    controller: _locationController,
                    style: inputTextStyle,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: l10n.enquiryFormLocationHint,
                      hintStyle: inputHintStyle,
                      filled: true,
                      fillColor: inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 22,
                      ),
                    ),
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormGuestCount,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  TextField(
                    controller: _guestCountController,
                    style: inputTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: l10n.enquiryFormGuestCountHint,
                      hintStyle: inputHintStyle,
                      filled: true,
                      fillColor: inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 22,
                      ),
                    ),
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormBudget,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _budgetMinController,
                          style: inputTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: l10n.enquiryFormBudgetHint,
                            hintStyle: inputHintStyle,
                            filled: true,
                            fillColor: inputFillColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                          ),
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: TextField(
                          controller: _budgetMaxController,
                          style: inputTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: l10n.enquiryFormBudgetHint,
                            hintStyle: inputHintStyle,
                            filled: true,
                            fillColor: inputFillColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormEventDate,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  InkWell(
                    onTap: _pickEventDateTime,
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: inputFillColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              dateLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: _selectedEventDateTime == null
                                  ? inputHintStyle
                                  : inputTextStyle,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 34,
                            color: colorScheme.onSurface,
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormNotes,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  10.vertSpacing,
                  TextField(
                    controller: _notesController,
                    style: inputTextStyle,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: l10n.enquiryFormNotesHint,
                      hintStyle: inputHintStyle,
                      filled: true,
                      fillColor: inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                  20.vertSpacing,
                  Text(
                    l10n.enquiryFormImages,
                    style: 15.w600.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  12.vertSpacing,
                  const EnquiryFormUploadTiles(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
            child: EventraButton(
              buttonText: l10n.enquiryFormReviewButton,
              onPressed: _onReviewPressed,
              width: double.infinity,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onReviewPressed() async {
    final budgetMin = _budgetMinController.text.trim();
    final budgetMax = _budgetMaxController.text.trim();
    final location = _locationController.text.trim();
    final guestCount = int.tryParse(_guestCountController.text.trim());
    final notes = _notesController.text.trim();

    final hasBudget = budgetMin.isNotEmpty || budgetMax.isNotEmpty;
    final selectedBudget = hasBudget ? '$budgetMin - $budgetMax' : '';

    kLogs('Event Type: $_selectedEventType');
    kLogs('Location: $location');
    kLogs('Guest Count: $guestCount');
    kLogs('Budget: $selectedBudget');
    kLogs('Date: $_selectedEventDateTime');
    kLogs('Notes: $notes');

    if (_selectedEventType.isEmpty) {
      GlobalSnackBar.showInfo(context.l10n.enquiryFormEventType);
      return;
    }

    context.read<ClientBookingBloc>().add(
      EnquiryFormFieldChanged(
        eventType: _selectedEventType,
        location: location,
        guestCount: guestCount,
        budget: selectedBudget,
        eventDate: _selectedEventDateTime,
        notes: notes,
      ),
    );

    context.read<ClientBookingBloc>().add(const EnquiryReviewRequested());

    if (mounted) {
      await context.pushNamed(EnquiryReviewPage.name);
    }
  }

  Future<String?> _showEventTypePicker(
    List<MapEntry<String, String>> options,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;

    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  12.vertSpacing,
                  ...options.asMap().entries.expand((item) {
                    final index = item.key;
                    final entry = item.value;
                    final isLast = index == options.length - 1;

                    return [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          entry.value,
                          style: 16.w400.copyWith(color: colorScheme.onSurface),
                        ),
                        onTap: () =>
                            Navigator.of(bottomSheetContext).pop(entry.key),
                      ),
                      if (!isLast)
                        Divider(
                          height: 1,
                          color: colorScheme.outline.withValues(alpha: 0.24),
                        ),
                    ];
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickEventDateTime() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedEventDateTime ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (date == null || !mounted) {
      return;
    }

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedEventDateTime ?? now),
    );

    if (time == null) {
      return;
    }

    setState(() {
      _selectedEventDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
}
