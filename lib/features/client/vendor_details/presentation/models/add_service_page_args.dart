enum AddServiceTab { catalog, video }

class AddServicePageArgs {
  const AddServicePageArgs({
    this.initialTab = AddServiceTab.catalog,
  });

  final AddServiceTab initialTab;
}
