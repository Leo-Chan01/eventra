import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/add_service_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_catalog_form.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_tab_selector.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_video_form.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({
    this.args = const AddServicePageArgs(),
    super.key,
  });

  static const String path = '/add-service';
  static const String name = 'add-service';

  final AddServicePageArgs args;

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  late AddServiceTab selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.args.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(l10n.addServiceTitle, style: 17.w500),
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddServiceTabSelector(
                selectedTab: selectedTab,
                onTabSelected: (tab) {
                  setState(() {
                    selectedTab = tab;
                  });
                },
              ),
              24.vertSpacing,
              if (selectedTab == AddServiceTab.catalog)
                const AddServiceCatalogForm()
              else
                const AddServiceVideoForm(),
              32.vertSpacing,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: EventraButton(
          buttonText: l10n.addServiceSendButton,
          // onPressed: null,
        ),
      ),
    );
  }
}
