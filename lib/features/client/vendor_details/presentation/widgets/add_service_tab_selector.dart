import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/add_service_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_tab_selector_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AddServiceTabSelector extends StatelessWidget {
  const AddServiceTabSelector({
    required this.selectedTab,
    required this.onTabSelected,
    super.key,
  });

  final AddServiceTab selectedTab;
  final ValueChanged<AddServiceTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AddServiceTabSelectorItem(
            label: context.l10n.addServiceCreateCatalogTab,
            isSelected: selectedTab == AddServiceTab.catalog,
            onTap: () => onTabSelected(AddServiceTab.catalog),
          ),
        ),
        20.horizSpacing,
        Expanded(
          child: AddServiceTabSelectorItem(
            label: context.l10n.addServiceShowcaseVideoTab,
            isSelected: selectedTab == AddServiceTab.video,
            onTap: () => onTabSelected(AddServiceTab.video),
          ),
        ),
      ],
    );
  }
}
